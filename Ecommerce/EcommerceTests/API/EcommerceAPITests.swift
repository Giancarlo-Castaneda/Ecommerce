import XCTest

@testable import Ecommerce

final class EcommerceAPITests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = EcommerceAPI

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

    func test_init_givenValues_shouldSetValues() {
        sut = SUT(path: "foo.path",
                  method: .get,
                  body: ["foo.body.key": "foo.body.value"],
                  queryItems: [URLQueryItem(name: "foo.query.0.name", value: "foo.query.0.value")])

        XCTAssertEqual(sut.path, "foo.path")
        XCTAssertEqual(sut.method.rawValue, "GET")
        XCTAssertEqual(sut.body?["foo.body.key"] as? String, "foo.body.value")
        XCTAssertEqual(sut.queryItems?[0].name, "foo.query.0.name")
        XCTAssertEqual(sut.queryItems?[0].value, "foo.query.0.value")
    }
}
