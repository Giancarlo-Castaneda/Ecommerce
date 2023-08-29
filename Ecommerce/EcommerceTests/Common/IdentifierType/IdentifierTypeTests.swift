import XCTest

@testable import Ecommerce

final class IdentifierTypeTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = MyObject.IdentifierTypeTest

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

    func test_init_shouldBeSetIdString() {
        sut = SUT("foo.value")

        XCTAssertEqual(sut.wrappedValue, "foo.value")
    }

    func test_initWithDecoder_shouldBeSetIdString() throws {
        let jsonData = Data("\"foo.value\"".utf8)

        let decoder = JSONDecoder()
        sut = try decoder.decode(SUT.self, from: jsonData)

        XCTAssertEqual(sut.wrappedValue, "foo.value")
    }

    func test_equatable_shouldBeEqual() {
        let objectIdA = SUT("foo.value")
        let objectIdB = SUT("foo.value")

        XCTAssertEqual(objectIdA, objectIdB)
    }

    func test_equatable_shouldNotBeEqual() {
        let objectIdA = SUT("foo.value")
        let objectIdB = SUT("bar.value")

        XCTAssertNotEqual(objectIdA, objectIdB)
    }
}

extension IdentifierTypeTests {

    struct MyObject {

        // swiftlint:disable nesting
        typealias IdentifierTypeTest = IdentifierType<Self, String>

        let id: IdentifierTypeTest
    }
}
