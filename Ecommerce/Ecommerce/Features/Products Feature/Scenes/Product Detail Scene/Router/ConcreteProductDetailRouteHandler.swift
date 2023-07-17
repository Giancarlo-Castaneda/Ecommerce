import UIKit

final class ConcreteProductDetailRouteHandler: RouteHandler {

    // MARK: - Private Properties

    private let productRepository: ProductRepository
    private let routeService: RouteService

    // MARK: - Initialization

    init(productRepository: ProductRepository, routeService: RouteService) {
        self.productRepository = productRepository
        self.routeService = routeService
    }

    // MARK: - Internal Methods

    func destination(of route: ProductDetailRoute) -> UIViewController {
        ProductDetailSceneFactory(id: route.id, repository: productRepository, routerService: routeService).build()
    }

    func navigate(to route: ProductDetailRoute,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?) {

        let viewController = destination(of: route)
        viewController.view.tintColor = presentingViewController.view.tintColor

        presentingViewController.show(viewController, sender: nil)
    }
}
