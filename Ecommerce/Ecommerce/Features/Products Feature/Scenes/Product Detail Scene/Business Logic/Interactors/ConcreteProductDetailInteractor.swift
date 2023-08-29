import Foundation

final class ConcreteProductDetailInteractor: ProductDetailInteractor {

    // MARK: - Private Properties

    private let fetchDetailWorker: ProductFetchDetailWorker

    // MARK: - Internal Properties

    var presenter: ProductDetailInteractorOutput?

    // MARK: - Initialization

    init(fetchDetailWorker: ProductFetchDetailWorker) {
        self.fetchDetailWorker = fetchDetailWorker
    }

    // MARK: - Internal Methods

    func fetchDetail(id: SearchItemID) {
        Task {
            do {
                await presenter?.loading()

                let detail = try await fetchDetailWorker.execute(id: id)

                await presenter?.fetchedDetail(detail: detail.detail)
            } catch {
                await presenter?.error(error)
            }
        }
    }
}
