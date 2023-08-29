import XCTest

@testable import Ecommerce

final class ConcreteSearchInteractorTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteSearchInteractor

    // MARK: Private Properties

    private var sut: SUT!
    private var mockSearchFetchWorker: MockSearchFetchWorker!
    private var mockPresenter: MockSearchInteractorOutput!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockPresenter = .init()
        mockSearchFetchWorker = .init()
        sut = SUT(searchWorker: mockSearchFetchWorker)
        sut.presenter = mockPresenter
    }

    override func tearDown() {
        super.tearDown()

        mockPresenter = nil
        mockSearchFetchWorker = nil
        sut = nil
    }

    // MARK: Tests

    func test_search_shouldCallSearchFetchWorkerExecute() async {
        let expectation = XCTestExpectation(description: #function)
        mockPresenter.expectation = expectation
        mockSearchFetchWorker.setStubValue(Helper.makeSearchModel(), for: .execute)

        XCTAssertFalse(mockSearchFetchWorker.verify([.execute]))

        sut.search(query: "foo.query")

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockSearchFetchWorker.verify([.execute]))
        XCTAssertEqual(mockSearchFetchWorker.receivedSearchQuery?.query, "foo.query")
        XCTAssertEqual(mockSearchFetchWorker.receivedSearchQuery?.offset, 0)
        XCTAssertEqual(mockSearchFetchWorker.receivedSearchQuery?.limit, 20)
        XCTAssertEqual(mockSearchFetchWorker.receivedSearchQuery?.siteId, "MLA")
    }

    func test_search_shouldCallPresenterSearched() async {
        let expectation = XCTestExpectation(description: #function)
        mockPresenter.expectation = expectation
        mockSearchFetchWorker.setStubValue(Helper.makeSearchModel(), for: .execute)

        XCTAssertFalse(mockPresenter.verify([.loading, .searched]))

        sut.search(query: "foo.query")

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockPresenter.verify([.loading, .searched]))
    }

    func test_search_whenSearchFetchWorkerThrowsError_shouldCallPresenterError() async {
        let expectation = XCTestExpectation(description: #function)
        mockPresenter.expectation = expectation
        mockSearchFetchWorker.setStubValue(Helper.makeError(code: 400), for: .execute)

        XCTAssertFalse(mockPresenter.verify([.loading, .error]))

        sut.search(query: "foo.query")

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockPresenter.verify([.loading, .error]))
    }

    func test_search_whenIsCalledMultiplesTimes_shouldCallPresenterSearchedMultiplesTimes() async throws {
        let expectation = XCTestExpectation(description: #function)
        expectation.expectedFulfillmentCount = 2
        mockPresenter.expectation = expectation
        let searchItem = try Helper.makeSearchItemModel()
        mockSearchFetchWorker.setStubValue(Helper.makeSearchModel(paging: Helper.makePagingModel(totalResults: 111),
                                                                  items: [searchItem, searchItem]),
                                           for: .execute)

        XCTAssertFalse(mockPresenter.verify([.loading, .searched]))

        sut.search(query: "foo.query")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.sut.search(query: "foo.query")
        }

        await fulfillment(of: [expectation], timeout: 2)

        XCTAssertTrue(mockPresenter.verify([.loading, .searched, .loading, .searched]))
        XCTAssertEqual(mockPresenter.receivedSearchItems.count, 4)
    }
}
