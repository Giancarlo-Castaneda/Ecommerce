import Foundation

final class ConcreteProductSpecViewModelFactory: ProductSpecViewModelFactory {

    // MARK: - Internal Methods

    func makeProductSpecHeaderViewModel(detail: ProductDetailModel,
                                        numberFormatter: NumberFormatter) -> ProductSpecViewModel {

        ConcreteProductSpecHeaderViewModel(detail: detail, numberFormatter: numberFormatter)
    }
}
