import UIKit

final class ProductDetailSceneFactory {

    // MARK: - Private Properties

    private let id: SearchItemID
    private let repository: ProductRepository
    private let routerService: RouteService

    // MARK: - Initialization

    init(id: SearchItemID, repository: ProductRepository, routerService: RouteService) {
        self.id = id
        self.repository = repository
        self.routerService = routerService
    }

    // MARK: - Internal Methods

    func build() -> UIViewController {
        let fetchWorker = ConcreteProductFetchDetailWorker(productRepository: repository)
        let interactor = ConcreteProductDetailInteractor(fetchDetailWorker: fetchWorker)
        let presenter = ConcreteProductDetailPresenter()
        let viewController = ProductDetailViewController(id: id, routeService: routerService)

        viewController.interactor = interactor
        presenter.view = viewController
        interactor.presenter = presenter

        return viewController
    }
}
