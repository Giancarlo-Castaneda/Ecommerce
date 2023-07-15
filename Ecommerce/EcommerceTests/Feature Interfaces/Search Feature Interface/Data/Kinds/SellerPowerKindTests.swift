import XCTest

@testable import Ecommerce

final class SellerPowerKindTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = SellerPowerKind

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

    func test_rawValue_whenIsGold_shouldReturnValue() {
        sut = .gold

        XCTAssertEqual(sut.rawValue, "gold")
    }

    func test_rawValue_whenIsPlatinum_shouldReturnValue() {
        sut = .platinum

        XCTAssertEqual(sut.rawValue, "platinum")
    }
}
