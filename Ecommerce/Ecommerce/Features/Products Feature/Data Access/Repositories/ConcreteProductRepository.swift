import Foundation

final class ConcreteProductRepository: ProductRepository {

    // MARK: - Private Properties

    private let networkingProvider: NetworkingProvider

    // MARK: - Initialization

    init(networkingProvider: NetworkingProvider) {
        self.networkingProvider = networkingProvider
    }

    // MARK: - Internal Methods

    func fetchItem(id: SearchItemID) async throws -> ProductModel {
        let endpoint = EcommerceAPI.itemsGET(id: id)
        let dto = try await networkingProvider.sendRequest(endpoint: endpoint, responseModel: [ProductDTO].self)

        guard let first = dto.first else { fatalError() }

        return ProductModel(first)
    }
}
