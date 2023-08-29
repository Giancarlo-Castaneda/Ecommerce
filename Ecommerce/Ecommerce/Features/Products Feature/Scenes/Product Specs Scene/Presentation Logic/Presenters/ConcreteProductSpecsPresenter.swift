import Foundation

final class ConcreteProductSpecsPresenter: ProductSpecsInteractorOutput {

    // MARK: - Private Properties

    private let dataProviderFactory: ProductSpecsDataProviderFactory

    // MARK: - Internal Properties

    weak var view: ProductSpecsPresenterOutput?

    // MARK: - Initialization

    init(dataProviderFactory: ProductSpecsDataProviderFactory) {
        self.dataProviderFactory = dataProviderFactory
    }

    // MARK: - Internal Methods

    func loading() async {
        await view?.configure(state: .loading)
    }

    func fetchedSpecs(detail: ProductDetailModel) async {
        let dataProvider = dataProviderFactory.makeProductSpecsDataProvider(detail: detail)

        await view?.configure(state: .content(dataProvider: dataProvider))
    }

    func error(_ error: Error) async {
        await view?.configure(state: .failure(title: L10n.Localizable.error, message: error.localizedDescription))
    }
}
