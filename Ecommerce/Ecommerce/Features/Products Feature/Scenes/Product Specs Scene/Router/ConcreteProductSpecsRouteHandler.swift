import UIKit

final class ConcreteProductSpecsRouteHandler: RouteHandler {

    // MARK: - Private Properties

    private let productRepository: ProductRepository
    private let numberFormatter: NumberFormatter

    // MARK: - Initialization

    init(productRepository: ProductRepository, numberFormatter: NumberFormatter) {
        self.productRepository = productRepository
        self.numberFormatter = numberFormatter
    }

    // MARK: - Internal Methods

    func destination(of route: ProductSpecsRoute) -> UIViewController {
        ProductSpecsSceneFactory(id: route.id,
                                 productRepository: productRepository,
                                 numberFormater: numberFormatter).build()
    }

    func navigate(to route: ProductSpecsRoute,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?) {

        let specsViewController = destination(of: route)

        specsViewController.modalPresentationStyle = .pageSheet
        specsViewController.isModalInPresentation = true

        let customDetent = UISheetPresentationController.Detent.custom { _ in
            return presentingViewController.view.bounds.height * 0.2
        }

        if let sheet = specsViewController.sheetPresentationController {
            sheet.detents = [customDetent, .large()]
            sheet.selectedDetentIdentifier = customDetent.identifier
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.largestUndimmedDetentIdentifier = customDetent.identifier
            sheet.prefersGrabberVisible = true
        }

        presentingViewController.present(specsViewController, animated: true, completion: nil)
    }
}
