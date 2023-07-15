import Ecommerce
import Foundation

final class MockSearchInteractor: SearchInteractor, Mockable {

    // MARK: - Invocation

    enum Invocation {
        case search
    }

    // MARK: - Stubs

    var receivedQuery: String?

    // MARK: - Internal Methods

    func search(query: String) {
        append(.search)

        receivedQuery = query
    }
}
