import UIKit

final class ProductSpecsSceneFactory {

    // MARK: - Private Properties

    private let id: SearchItemID
    private let productRepository: ProductRepository
    private let numberFormater: NumberFormatter

    // MARK: - Initialization

    init(id: SearchItemID, productRepository: ProductRepository, numberFormater: NumberFormatter) {
        self.id = id
        self.productRepository = productRepository
        self.numberFormater = numberFormater
    }

    // MARK: - Internal Methods

    func build() -> UIViewController {
        let fetchWorker = ConcreteProductFetchDetailWorker(productRepository: productRepository)
        let interactor = ConcreteProductSpecsInteractor(fetchDetailWorker: fetchWorker)
        let viewModelFactory = ConcreteProductSpecViewModelFactory()
        let dataProviderFactory = ConcreteProductSpecsDataProviderFactory(viewModelFactory: viewModelFactory,
                                                                            numberFormatter: numberFormater)
        let presenter = ConcreteProductSpecsPresenter(dataProviderFactory: dataProviderFactory)
        let viewController = ProductDetailSpecsViewController(productId: id)

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController

        return viewController
    }
}
