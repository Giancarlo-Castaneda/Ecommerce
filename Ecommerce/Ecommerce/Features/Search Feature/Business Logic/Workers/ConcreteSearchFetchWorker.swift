import Foundation

final class ConcreteSearchFetchWorker: SearchFetchWorker {

    // MARK: - Private Properties

    private let repository: SearchRepository

    // MARK: - Initialization

    init(repository: SearchRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func execute(query: String, siteId: String, offset: Int, limit: Int) async throws -> SearchModel {
        try await repository.search(query: query, siteId: siteId, offset: offset, limit: limit)
    }
}
