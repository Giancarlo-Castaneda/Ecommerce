import Ecommerce
import Foundation
import XCTest

final class MockSearchInteractorOutput: SearchInteractorOutput, Mockable {

    // MARK: - Invocation

    enum Invocation {
        case loading
        case searched
        case error
    }

    // MARK: - Internal Properties

    var expectation: XCTestExpectation?
    var receivedError: Error?
    var receivedSearchItems: [SearchItemModel] = []

    // MARK: - Internal Methods

    func loading() async {
        append(.loading)
    }

    func searched(items: [SearchItemModel]) async {
        append(.searched)

        receivedSearchItems = items

        expectation?.fulfill()
    }

    func error(_ error: Error) async {
        append(.error)

        receivedError = error

        expectation?.fulfill()
    }
}
