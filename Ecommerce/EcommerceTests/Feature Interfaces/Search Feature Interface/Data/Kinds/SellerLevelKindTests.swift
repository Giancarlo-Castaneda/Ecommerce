import XCTest

@testable import Ecommerce

final class SellerLevelKindTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = SellerLevelKind

    // MARK: Private Properties

    private var sut: SUT!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    // MARK: Tests

    func test_rawValue_whenIsThe5_Green_shouldReturnValue() {
        sut = .the5_Green

        XCTAssertEqual(sut.rawValue, "5_green")
    }
}
