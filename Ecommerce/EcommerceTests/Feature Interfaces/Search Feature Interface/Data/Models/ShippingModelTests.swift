import XCTest

@testable import Ecommerce

final class ShippingModelTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ShippingModel

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

    func test_init_givenValues_shouldReturnValues() {
        sut = SUT(storePickUp: true,
                  freeShipping: false,
                  logisticType: "foo.logistic_type",
                  mode: "foo.mode",
                  tags: ["foo.tags.0", "foo.tags.1"])

        XCTAssertTrue(sut.storePickUp)
        XCTAssertFalse(sut.freeShipping)
        XCTAssertEqual(sut.logisticType, "foo.logistic_type")
        XCTAssertEqual(sut.mode, "foo.mode")
        XCTAssertEqual(sut.tags[0], "foo.tags.0")
        XCTAssertEqual(sut.tags[1], "foo.tags.1")
    }
}
