import UIKit

final class SearchViewController: UIViewController {

    // MARK: - View Components

    private lazy var searchBar = UISearchController().with {
        $0.searchBar.placeholder = L10n.Localizable.searchBarPlaceholder
        $0.searchBar.searchBarStyle = .minimal
        $0.searchResultsUpdater = self
    }

    private let layout = UICollectionViewFlowLayout().with {
        $0.itemSize = .zero
        $0.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    }

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).with {
        $0.backgroundColor = UIColor.clear
        $0.registerCell(SearchItemCell.self)
        $0.dataSource = self
        $0.delegate = self
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
    }

    private lazy var emptyView = EmptyView()

    // MARK: - Private Properties

    private var dataProvider: SearchDataProvider?
    private var query = ""
    private var pendingRequestWorkItem: DispatchWorkItem?
    private let routeService: RouteService

    // MARK: - Internal Properties

    var interactor: SearchInteractor?

    // MARK: - Initialization

    init(routeService: RouteService) {
        self.routeService = routeService

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
        interactor?.search(query: query)
    }

    // MARK: - Private Properties

    private func setupUI() {
        view.backgroundColor = AssetsColor.screenBackground.appColor
        layout.itemSize = size()
        navigationItem.searchController = searchBar
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.layout.topAnchor(to: view, vertical: .safeTop)
        collectionView.layout.bottomAnchor(to: view, vertical: .bottom)
        collectionView.layout.leadingAnchor(to: view, horizontal: .safeLeading)
        collectionView.layout.trailingAnchor(to: view, horizontal: .safeTrailing)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: L10n.Localizable.ok, style: .default)

        alert.addAction(okAction)
        alert.view.tintColor = view.tintColor

        present(alert, animated: true)
    }

    private func size() -> CGSize {
        let numberOfItemsPerRow = UIDevice.current.userInterfaceIdiom == .phone ? 2.0 : 3.0
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let horizontalInset = view.safeAreaInsets.left + view.safeAreaInsets.right

        return CGSize(width: screenWidth / numberOfItemsPerRow - (20 + horizontalInset),
                      height: screenHeight * 0.3)
    }

    private func emptyView(show: Bool) {
        emptyView.configureView(title: L10n.Localizable.searchEmptyTitle, body: L10n.Localizable.searchEmptyBody)
        collectionView.backgroundView = show ? emptyView : nil
    }
}

// MARK: - UISearchResultsUpdating

extension SearchViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }

        pendingRequestWorkItem?.cancel()

        let requestWorkItem = DispatchWorkItem { [weak self] in
            self?.query = query
            self?.interactor?.search(query: query)
        }

        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: requestWorkItem)
    }
}

// MARK: - SearchPresenterOutput

extension SearchViewController: SearchPresenterOutput {

    func configure(state: SearchViewState) {
        switch state {
        case let .content(dataProvider):
            self.dataProvider = dataProvider
            collectionView.reloadData()
            emptyView(show: false)

        case let .failure(title, message):
            showAlert(title: title, message: message)

        case let .emptyView(show):
            emptyView(show: show)

        case .loading:
            break
        }
    }
}

// MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataProvider?.numberOfSections() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataProvider?.numberOfItems(inSection: section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard
            let viewModel = dataProvider?.viewModel(at: indexPath)
        else { fatalError("Undefined view model for indexPath \(indexPath)") }

        let cell = collectionView.dequeueCell(SearchItemCell.self, for: indexPath)
        cell.configure(item: viewModel)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension SearchViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {

        let offSetY = collectionView.contentOffset.y
        let contentHeight = collectionView.contentSize.height

        if offSetY > (contentHeight - collectionView.frame.size.height - 300) {
            interactor?.search(query: query)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard
            let viewModel = dataProvider?.viewModel(at: indexPath)
        else { fatalError("Undefined view model for indexPath \(indexPath)") }

        routeService.navigate(to: ProductDetailRoute(id: viewModel.id), from: self, presentationStyle: .currentContext)
    }
}
