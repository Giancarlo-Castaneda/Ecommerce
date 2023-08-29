import Foundation

final class ConcreteProductSpecViewModelFactory: ProductSpecViewModelFactory {

    // MARK: - Internal Methods

    func makeProductSpecAttributeViewModel(attribute: AttributeModel) -> ProductSpecViewModel {
        ConcreteProductSpecAttributeViewModel(attribute: attribute)
    }

    func makeProductSpecHeaderViewModel(detail: ProductDetailModel,
                                        numberFormatter: NumberFormatter) -> ProductSpecViewModel {

        ConcreteProductSpecHeaderViewModel(detail: detail, numberFormatter: numberFormatter)
    }
}
