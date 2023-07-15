import Foundation

final class ConcreteSearchRepository: SearchRepository {

    // MARK: - Private Properties

    private let networkingProvider: NetworkingProvider

    // MARK: - Initialization

    init(networkingProvider: NetworkingProvider) {
        self.networkingProvider = networkingProvider
    }

    // MARK: - Internal Methods

    func search(query: String, siteId: String, offset: Int, limit: Int) async throws -> SearchModel {
        let endpoint = EcommerceAPI.searchByQueryGET(query: query, siteId: siteId, offset: offset, limit: limit)
        let dto = try await networkingProvider.sendRequest(endpoint: endpoint, responseModel: SearchDTO.self)

        return SearchModel(dto)
    }
}
