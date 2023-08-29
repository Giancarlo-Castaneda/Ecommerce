import Ecommerce
import Foundation

final class MockSearchFetchWorker: SearchFetchWorker, Mockable {

    // MARK: - Invocation

    enum Invocation {
        case execute
    }

    // MARK: - Stubs

    var receivedSearchQuery: (query: String, siteId: String, offset: Int, limit: Int)?

    // MARK: - Internal Methods

    func execute(query: String, siteId: String, offset: Int, limit: Int) async throws -> SearchModel {
        append(.execute)

        receivedSearchQuery = (query: query, siteId: siteId, offset: offset, limit: limit)

        if let error: Error = getStubOptionalValue(for: .execute) {
            throw error
        }

        return getStubValue(for: .execute)
    }
}
