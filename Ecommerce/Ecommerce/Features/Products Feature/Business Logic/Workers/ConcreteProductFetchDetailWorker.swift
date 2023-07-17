import Foundation

final class ConcreteProductFetchDetailWorker: ProductFetchDetailWorker {

    // MARK: - Private Properties

    private let productRepository: ProductRepository

    // MARK: - Initialization

    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }

    // MARK: - Internal Methods

    func execute(id: SearchItemID) async throws -> ProductModel {
        try await productRepository.fetchItem(id: id)
    }
}
