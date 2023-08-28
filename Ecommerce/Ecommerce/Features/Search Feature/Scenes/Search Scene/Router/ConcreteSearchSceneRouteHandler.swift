import UIKit

final class ConcreteSearchSceneRouteHandler: RouteHandler {

    // MARK: - Private Properties

    private let searchRepository: SearchRepository
    private let routeService: RouteService

    // MARK: - Initialization

    init(searchRepository: SearchRepository, routeService: RouteService) {
        self.searchRepository = searchRepository
        self.routeService = routeService
    }

    // MARK: - Internal Methods

    func destination(of route: SearchRoute) -> UIViewController {
        SearchSceneFactory(searchRepository: searchRepository, routeService: routeService).build()
    }

    func navigate(to route: SearchRoute,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?) {

        let viewController = destination(of: route)
        viewController.view.tintColor = presentingViewController.view.tintColor

        if let navigation = presentingViewController as? UINavigationController {
            navigation.setViewControllers([viewController], animated: false)
        } else {
            presentingViewController.show(viewController, sender: nil)
        }
    }
}
