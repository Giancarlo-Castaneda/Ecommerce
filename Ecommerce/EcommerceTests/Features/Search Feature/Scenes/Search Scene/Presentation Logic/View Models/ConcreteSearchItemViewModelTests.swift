import XCTest

@testable import Ecommerce

final class ConcreteSearchItemViewModelTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteSearchItemViewModel

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

    func test_init_givenValues_shouldSetValues() throws {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "fr_CA")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2

        let shipping = Helper.makeShippingModel(freeShipping: true)
        let url = try XCTUnwrap(URL(string: "foo.image.com"))
        let item = try Helper.makeSearchItemModel(id: SearchItemID("foo.id"),
                                                  title: "foo.title",
                                                  thumbnail: url,
                                                  currencyId: "ARS",
                                                  price: 1111.1111,
                                                  originalPrice: 2222.2222,
                                                  shipping: shipping)

        sut = SUT(searchItem: item, numberFormatter: formatter)

        XCTAssertEqual(sut.id.wrappedValue, "foo.id")
        XCTAssertEqual(sut.title, "foo.title")
        XCTAssertEqual(sut.imageURL.absoluteString, "foo.image.com")
        XCTAssertEqual(sut.price, "1 111,11 ARS")
        XCTAssertEqual(sut.originalPrice, "2 222,22 ARS")
        XCTAssertEqual(sut.discount, "-50%")
        XCTAssertTrue(sut.freeShipping)
    }
}
