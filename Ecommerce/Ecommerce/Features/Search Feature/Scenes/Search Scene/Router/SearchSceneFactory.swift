import UIKit

final class SearchSceneFactory {

    // MARK: - Private Properties

    private let searchRepository: SearchRepository
    private let routeService: RouteService

    // MARK: - Initialization

    init(searchRepository: SearchRepository, routeService: RouteService) {
        self.searchRepository = searchRepository
        self.routeService = routeService
    }

    // MARK: - Internal Methods

    func build() -> UIViewController {
        let searchWorker = ConcreteSearchFetchWorker(repository: searchRepository)
        let interactor = ConcreteSearchInteractor(searchWorker: searchWorker)
        let viewModelFactory = ConcreteSearchItemViewModelFactory()
        let dataProviderFactory = ConcreteSearchDataProviderFactory(viewModelFactory: viewModelFactory,
                                                                    numberFormatter: appDependency.currencyFormatter)
        let presenter = ConcreteSearchPresenter(dataProviderFactory: dataProviderFactory)
        let viewController = SearchViewController(routeService: routeService)

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController

        return viewController
    }
}
