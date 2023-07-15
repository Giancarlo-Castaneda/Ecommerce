import Ecommerce
import Foundation

final class MockSearchRepository: SearchRepository, Mockable {

    // MARK: - Invocation

    enum Invocation {
        case search
    }

    // MARK: - Stubs

    var receivedSearchQuery: (query: String, siteId: String, offset: Int, limit: Int)?

    // MARK: - Internal Methods

    func search(query: String, siteId: String, offset: Int, limit: Int) async throws -> SearchModel {
        append(.search)

        receivedSearchQuery = (query: query, siteId: siteId, offset: offset, limit: limit)

        if let error: Error = getStubOptionalValue(for: .search) {
            throw error
        }

        return getStubValue(for: .search)
    }
}
