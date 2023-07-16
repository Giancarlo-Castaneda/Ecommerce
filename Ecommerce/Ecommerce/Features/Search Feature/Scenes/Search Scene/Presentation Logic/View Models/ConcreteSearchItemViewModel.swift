import Foundation

struct ConcreteSearchItemViewModel: SearchItemViewModel {

    // MARK: - Internal Computed Properties

    var id: SearchItemID {
        searchItem.id
    }

    var title: String {
        searchItem.title
    }

    var imageURL: URL {
        searchItem.thumbnail
    }

    var price: String {
        numberFormatter.string(from: NSNumber(floatLiteral: searchItem.price)) ?? "Price not available"
    }

    var originalPrice: String? {
        if let original = searchItem.originalPrice {
            return numberFormatter.string(from: NSNumber(floatLiteral: original))
        }

        return nil
    }

    var discount: String? {
        if let original = searchItem.originalPrice, searchItem.price < original {
            return "\(Int((searchItem.price * 100) / original))%"
        }
        return nil
    }

    var freeShipping: Bool {
        searchItem.shipping.freeShipping
    }

    // MARK: - Private Properties

    private let searchItem: SearchItemModel
    private let numberFormatter: NumberFormatter

    // MARK: - Initialization

    init(searchItem: SearchItemModel, numberFormatter: NumberFormatter) {
        self.searchItem = searchItem
        self.numberFormatter = numberFormatter
        self.numberFormatter.currencySymbol = searchItem.currencyId
    }
}
