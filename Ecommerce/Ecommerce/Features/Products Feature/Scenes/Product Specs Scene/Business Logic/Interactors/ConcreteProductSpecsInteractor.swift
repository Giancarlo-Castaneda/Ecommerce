import Foundation

final class ConcreteProductSpecsInteractor: ProductSpecsInteractor {

    // MARK: - Private Properties

    private let fetchDetailWorker: ProductFetchDetailWorker

    // MARK: - Internal Properties

    var presenter: ProductSpecsInteractorOutput?

    // MARK: - Initalization

    init(fetchDetailWorker: ProductFetchDetailWorker) {
        self.fetchDetailWorker = fetchDetailWorker
    }

    // MARK: - Internal Methods

    func fetchSpecs(id: SearchItemID) {
        Task {
            do {
                await presenter?.loading()

                let detail = try await fetchDetailWorker.execute(id: id)

                await presenter?.fetchedSpecs(detail: detail.detail)
            } catch {
                await presenter?.error(error)
            }
        }
    }
}
