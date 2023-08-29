import Foundation

struct ConcreteProductSpecHeaderViewModel: ProductSpecHeaderViewModel {

    // MARK: - Internal Computed Properties

    var title: String {
        detail.title.capitalized
    }

    var price: String {
        numberFormatter.string(from: NSNumber(floatLiteral: detail.price)) ?? "Price not available"
    }

    var originalPrice: String? {
        if let original = detail.originalPrice {
            return numberFormatter.string(from: NSNumber(floatLiteral: original))
        }

        return nil
    }

    // MARK: - Private Properties

    private let detail: ProductDetailModel
    private let numberFormatter: NumberFormatter

    // MARK: - Initialization

    init(detail: ProductDetailModel, numberFormatter: NumberFormatter) {
        self.detail = detail
        self.numberFormatter = numberFormatter
        self.numberFormatter.currencySymbol = detail.currencyId
    }
}
