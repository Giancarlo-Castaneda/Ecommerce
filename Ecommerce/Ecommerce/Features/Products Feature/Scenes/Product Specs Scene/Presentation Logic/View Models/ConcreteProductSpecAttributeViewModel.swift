import Foundation

struct ConcreteProductSpecAttributeViewModel: ProductSpecAttributeViewModel {

    // MARK: - Internal Computed Properties

    var name: String {
        attribute.name.capitalized
    }

    var value: String? {
        attribute.valueName?.capitalized
    }

    // MARK: - Private Properties

    private let attribute: AttributeModel

    // MARK: - Initialization

    init(attribute: AttributeModel) {
        self.attribute = attribute
    }
}
