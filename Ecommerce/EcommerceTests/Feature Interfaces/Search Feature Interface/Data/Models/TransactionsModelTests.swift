import XCTest

@testable import Ecommerce

final class TransactionsModelTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = TransactionsModel

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
        let rating = Helper.makeRatingsModel(negative: 111.1, neutral: 222.2, positive: 333.3)

        sut = SUT(canceled: 111,
                  completed: 222,
                  period: "foo.period",
                  rating: rating,
                  total: 333)

        XCTAssertEqual(sut.canceled, 111)
        XCTAssertEqual(sut.completed, 222)
        XCTAssertEqual(sut.period, "foo.period")
        XCTAssertEqual(sut.rating.negative, 111.1)
        XCTAssertEqual(sut.rating.neutral, 222.2)
        XCTAssertEqual(sut.rating.positive, 333.3)
        XCTAssertEqual(sut.total, 333)
    }
}
