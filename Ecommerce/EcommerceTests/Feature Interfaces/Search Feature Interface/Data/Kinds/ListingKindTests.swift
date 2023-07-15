import XCTest

@testable import Ecommerce

final class ListingKindTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ListingKind

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

    func test_rawValue_whenIsGoldPro_shouldReturnValue() {
        sut = .goldPro

        XCTAssertEqual(sut.rawValue, "gold_pro")
    }

    func test_rawValue_whenIsGoldSpecial_shouldReturnValue() {
        sut = .goldSpecial

        XCTAssertEqual(sut.rawValue, "gold_special")
    }
}
