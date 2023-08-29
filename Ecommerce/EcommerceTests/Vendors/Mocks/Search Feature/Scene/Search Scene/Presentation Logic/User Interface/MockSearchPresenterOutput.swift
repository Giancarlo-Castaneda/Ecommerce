import Ecommerce
import Foundation
import XCTest

final class MockSearchPresenterOutput: SearchPresenterOutput, Mockable {

    // MARK: - Invocation

    enum Invocation {
        case configureWithEmptyView
        case configureWithContent
        case configureWithFailure
        case configureWithLoading
    }

    // MARK: - Stubs

    var expectation: XCTestExpectation?
    var receivedState: SearchViewState?
    var receivedDataProvider: SearchDataProvider?
    var receivedFailure: (title: String, message: String)?

    // MARK: - Internal Methods

    func configure(state: SearchViewState) {
        receivedState = state

        switch state {
        case .emptyView:
            append(.configureWithEmptyView)

        case let .content(dataProvider):
            append(.configureWithContent)
            receivedDataProvider = dataProvider

        case let .failure(title, message):
            append(.configureWithFailure)
            receivedFailure = (title, message)

        case .loading:
            append(.configureWithLoading)
        }

        expectation?.fulfill()
    }
}
