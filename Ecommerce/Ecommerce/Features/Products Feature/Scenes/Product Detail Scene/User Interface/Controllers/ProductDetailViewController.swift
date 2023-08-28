import UIKit

final class ProductDetailViewController: UIViewController {

    // MARK: - View Components

    private lazy var contentView = ProductDetailContentView()

    // MARK: - Private Properties

    private let id: SearchItemID
    private let routeService: RouteService

    // MARK: - Internal Properties

    var interactor: ProductDetailInteractor?

    // MARK: - Initialization

    init(id: SearchItemID, routeService: RouteService) {
        self.id = id
        self.routeService = routeService

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        interactor?.fetchDetail(id: id)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.delegate = self
        showProductSpecs()
    }

    // MARK: - Private Methods

    private func showProductSpecs() {
        routeService.navigate(to: ProductSpecsRoute(id: self.id), from: self, presentationStyle: .currentContext)
    }

    private func setupUI() {
        view.backgroundColor = AssetsColor.screenBackground.appColor
        view.addSubview(contentView)
    }

    private func setupConstraints() {
        contentView.layout.topAnchor(to: view, vertical: .safeTop)
        contentView.layout.bottomAnchor(to: view)
        contentView.layout.fillSuperviewHorizontally()
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(okAction)
        alert.view.tintColor = view.tintColor

        present(alert, animated: true)
    }
}

// MARK: - ProductDetailPresenterOutput

extension ProductDetailViewController: ProductDetailPresenterOutput {

    func configure(title: String) {
        self.title = title
    }

    func configure(state: ProductDetailViewState) {
        switch state {
        case let .content(detail):
            contentView.configureView(pictures: detail.pictures)

        case let .failure(title, message):
            showAlert(title: title, message: message)

        case .loading:
            break
        }
    }
}

// MARK: - UINavigationControllerDelegate

extension ProductDetailViewController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        if operation == .pop {
            presentedViewController?.dismiss(animated: true)
        }

        return nil
    }
}
