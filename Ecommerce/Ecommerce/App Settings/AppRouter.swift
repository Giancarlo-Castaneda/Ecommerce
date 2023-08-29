import UIKit

final class AppRouter {

    // MARK: - Internal Properties

    static let shared = AppRouter()
    var window: UIWindow?

    // MARK: - Internal Methods

    func start() {
        guard
            let rootViewController = window?.rootViewController
        else {
            let navigationController = UINavigationController()
            navigationController.view.tintColor = AssetsColor.purple.appColor

            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            appDependency.routeService.navigate(to: SearchRoute(),
                                                from: navigationController,
                                                presentationStyle: .currentContext)
            return
        }

        appDependency.routeService.navigate(to: SearchRoute(),
                                            from: rootViewController,
                                            presentationStyle: .currentContext)
    }
}
