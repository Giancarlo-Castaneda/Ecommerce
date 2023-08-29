import XCTest

@testable import Ecommerce

final class ConcreteSearchRepositoryTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteSearchRepository

    // MARK: Private Properties

    private var sut: SUT!
    private var mockNetworkingProvider: MockNetworkingProvider!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockNetworkingProvider = .init()
        sut = SUT(networkingProvider: mockNetworkingProvider)
    }

    override func tearDown() {
        super.tearDown()

        mockNetworkingProvider = nil
        sut = nil
    }

    // MARK: Tests

    func test_search_shouldCallNetworkingProviderSendRequest() async throws {
        mockNetworkingProvider.setStubValue(Helper.makeSearchDTO(), for: .genericSendRequest)

        XCTAssertFalse(mockNetworkingProvider.verify([.genericSendRequest]))

        _ = try await sut.search(query: "foo.query", siteId: "foo.site_id", offset: 111, limit: 222)

        XCTAssertTrue(mockNetworkingProvider.verify([.genericSendRequest]))
    }

    func test_search_whenNetworkingProviderResponseIsError_shouldReceiveError() async throws {
        mockNetworkingProvider.setStubValue(Helper.makeError(code: 400), for: .genericSendRequest)

        await XCTAssertThrowsAsyncError(try await sut.search(query: "foo.query",
                                                             siteId: "foo.site_id",
                                                             offset: 111,
                                                             limit: 222)) { error in

            XCTAssertEqual((error as NSError).code, 400)
        }
    }
}
