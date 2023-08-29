import UIKit

final class ProductDetailSpecsViewController: UIViewController {

    // MARK: - View Components

    private lazy var tableView = UITableView(frame: .zero, style: .insetGrouped).with {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.registerCell(ProductSpecsHeaderCell.self)
        $0.registerCell(UITableViewCell.self)
        $0.dataSource = self
    }

    // MARK: - Private Properties

    private let productId: SearchItemID
    private var dataProvider: ProductSpecDataProvider?

    // MARK: - Internal Properties

    var interactor: ProductSpecsInteractor?

    // MARK: - Initialization

    init(productId: SearchItemID) {
        self.productId = productId

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        interactor?.fetchSpecs(id: productId)
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = AssetsColor.screenBackground.appColor
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        tableView.layout.topAnchor(to: view, vertical: .safeTop)
        tableView.layout.bottomAnchor(to: view, vertical: .safeBottom)
        tableView.layout.fillSuperviewHorizontally()
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: L10n.Localizable.ok, style: .default)

        alert.addAction(okAction)
        alert.view.tintColor = view.tintColor

        present(alert, animated: true)
    }
}

// MARK: - ProductSpecsPresenterOutput

extension ProductDetailSpecsViewController: ProductSpecsPresenterOutput {

    func configure(state: ProductSpecsViewState) {
        switch state {
        case let .content(dataProvider):
            self.dataProvider = dataProvider
            tableView.reloadData()

        case let .failure(title, message):
            showAlert(title: title, message: message)

        case .loading:
            break
        }
    }
}

// MARK: - UITableViewDataSource

extension ProductDetailSpecsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        dataProvider?.numberOfSections() ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataProvider?.numberOfRows(inSection: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let viewModel = dataProvider?.viewModel(at: indexPath)
        else { fatalError("Undefined view model for indexPath \(indexPath) in file" + #file) }

        let visitor = ProductSpecsTableViewCellConfiguratorVisitor(tableView: tableView, indexPath: indexPath)

        return viewModel.accept(visitor: visitor)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dataProvider?.titleForHeader(inSection: section)
    }
}
