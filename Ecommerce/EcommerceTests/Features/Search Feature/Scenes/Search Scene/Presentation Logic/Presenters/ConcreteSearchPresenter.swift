import XCTest

@testable import Ecommerce

final class ConcreteSearchPresenterTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteSearchPresenter

    // MARK: Private Properties

    private var sut: SUT!
    private var mockView: MockSearchPresenterOutput!
    private var mockDataProviderFactory: MockSearchDataProviderFactory!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockView = .init()
        mockDataProviderFactory = .init()

        sut = SUT(dataProviderFactory: mockDataProviderFactory)
        sut.view = mockView
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        mockDataProviderFactory = nil
        mockView = nil
    }

    // MARK: Tests

    func test_searched_shouldCallViewConfigureWithContent() async throws {
        let expectation = XCTestExpectation(description: #function)
        mockView.expectation = expectation
        mockDataProviderFactory.setStubValue(MockSearchDataProvider(), for: .makeSearchDataProvider)

        XCTAssertFalse(mockView.verify([.configureWithContent]))

        let item = try Helper.makeSearchItemModel()
        await sut.searched(items: [item])

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockView.verify([.configureWithContent]))
        XCTAssertNotNil(mockView.receivedDataProvider)
    }

    func test_loading_shouldCallViewConfigureWithLoading() async {
        let expectation = XCTestExpectation(description: #function)
        mockView.expectation = expectation

        XCTAssertFalse(mockView.verify([.configureWithLoading]))

        await sut.loading()

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockView.verify([.configureWithLoading]))
    }

    func test_error_shouldCallViewConfigureWithFailure() async {
        let expectation = XCTestExpectation(description: #function)
        mockView.expectation = expectation

        XCTAssertFalse(mockView.verify([.configureWithFailure]))

        await sut.error(Helper.makeError(localizedDescription: #function))

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertEqual(mockView.receivedFailure?.title, "Error")
        XCTAssertEqual(mockView.receivedFailure?.message, #function)
        XCTAssertTrue(mockView.verify([.configureWithFailure]))
    }

    func test_view_shouldNotRetainView() {
        sut = SUT(dataProviderFactory: mockDataProviderFactory)

        var mockView = MockSearchPresenterOutput()
        sut.view = mockView

        mockView = MockSearchPresenterOutput()

        XCTAssertNil(sut.view)
    }
}
