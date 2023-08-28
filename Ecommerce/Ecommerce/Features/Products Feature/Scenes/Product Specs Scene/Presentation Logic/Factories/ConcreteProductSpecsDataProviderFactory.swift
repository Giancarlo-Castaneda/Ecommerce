import Foundation

final class ConcreteProductSpecsDataProviderFactory: ProductSpecsDataProviderFactory {

    // MARK: - Private Properties

    private let viewModelFactory: ProductSpecViewModelFactory
    private let numberFormatter: NumberFormatter

    // MARK: - Initalization

    init(viewModelFactory: ProductSpecViewModelFactory, numberFormatter: NumberFormatter) {
        self.viewModelFactory = viewModelFactory
        self.numberFormatter = numberFormatter
    }

    // MARK: - Internal Methods

    func makeProductSpecsDataProvider(detail: ProductDetailModel) -> ProductSpecDataProvider {
        ConcreteProductSpecDataProvider(productDetail: detail,
                                        viewModelFactory: viewModelFactory,
                                        numberFormatter: numberFormatter)
    }
}
