import Foundation

final class ConcreteSearchPresenter: SearchInteractorOutput {

    // MARK: - Private Properties

    private let dataProviderFactory: SearchDataProviderFactory

    // MARK: - Internal Properties

    weak var view: SearchPresenterOutput?

    // MARK: - Initialization

    init(dataProviderFactory: SearchDataProviderFactory) {
        self.dataProviderFactory = dataProviderFactory
    }
    // MARK: - Internal Methods

    func loading() async {
        await view?.configure(state: .loading)
    }

    func searched(items: [SearchItemModel]) async {
        let dataProvider = dataProviderFactory.makeSearchDataProvider(items: items)

        await view?.configure(state: .content(dataProvider: dataProvider))
    }

    func error(_ error: Error) async {
        await view?.configure(state: .failure(title: "Error", message: error.localizedDescription))
    }
}
