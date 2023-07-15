import XCTest

@testable import Ecommerce

final class BuyingKindTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = BuyingKind

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

    func test_rawValue_whenIsBuyItNow_shouldReturnValue() {
        sut = .buyItNow

        XCTAssertEqual(sut.rawValue, "buy_it_now")
    }
}
