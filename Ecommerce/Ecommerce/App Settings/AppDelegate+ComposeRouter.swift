import Foundation

// MARK: - ComposeRouter

extension AppDelegate {

    func composeRouter() {
        let routeService = appDependency.routeService

        routeService.register(ConcreteSearchSceneRouteHandler(searchRepository: appDependency.search.searchRepository,
                                                              routeService: appDependency.routeService))

        routeService.register(ConcreteProductDetailRouteHandler(productRepository: appDependency.product.productRepository,
                                                                routeService: appDependency.routeService))

        routeService.register(ConcreteProductSpecsRouteHandler(productRepository: appDependency.product.productRepository,
                                                               numberFormatter: appDependency.currencyFormatter))
    }
}
