import XCTest

@testable import Ecommerce

final class ConcreteSearchFetchWorkerTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteSearchFetchWorker

    // MARK: Private Properties

    private var sut: SUT!
    private var mockSearchRepository: MockSearchRepository!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockSearchRepository = .init()
        sut = SUT(repository: mockSearchRepository)
    }

    override func tearDown() {
        super.tearDown()

        mockSearchRepository = nil
        sut = nil
    }

    // MARK: Tests

    func test_execute_shouldCallRepositorySearch() async throws {
        mockSearchRepository.setStubValue(Helper.makeSearchModel(), for: .search)

        XCTAssertFalse(mockSearchRepository.verify([.search]))

        _ = try await sut.execute(query: "foo.query", siteId: "foo.site_id", offset: 111, limit: 222)

        XCTAssertTrue(mockSearchRepository.verify([.search]))
    }

    func test_execute_whenRepositoryThrowsAnError_shouldThrowError() async throws {
        mockSearchRepository.setStubValue(Helper.makeError(code: 400), for: .search)

        await XCTAssertThrowsAsyncError(try await sut.execute(query: "foo.query",
                                                              siteId: "foo.site_id",
                                                              offset: 111,
                                                              limit: 222)) { error in

            XCTAssertEqual((error as NSError).code, 400)
        }
    }
}
