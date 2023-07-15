import XCTest

@testable import Ecommerce

final class SearchDTOTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = SearchDTO

    // MARK: Private Properties

    private var sut: SUT!
    private var jsonDecoder: JSONDecoder!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        jsonDecoder = Helper.makeJSONDecoder(dateDecodingStrategy: .formatted(dateFormatter))
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    // MARK: Tests

    func test_initWithDecoder_givenValues_shouldSetValues() throws {
        let data = try Helper.makeSearchGETDTOData()
        sut = try jsonDecoder.decode(SUT.self, from: data)

        XCTAssertEqual(sut.siteId, "foo.site_id")
        XCTAssertEqual(sut.countryDefaultTimeZone, "GMT-03:00")
        XCTAssertEqual(sut.paging.total, 15877)
        XCTAssertEqual(sut.paging.primaryResults, 1000)
        XCTAssertEqual(sut.paging.offset, 0)
        XCTAssertEqual(sut.paging.limit, 2)
        XCTAssertEqual(sut.results[0].id.wrappedValue, "foo.results.0.id")
        XCTAssertEqual(sut.results[0].title, "foo.results.0.title")
        XCTAssertEqual(sut.results[0].condition, "foo.results.0.condition")
        XCTAssertEqual(sut.results[0].listingTypeId.rawValue, "gold_special")
        XCTAssertEqual(sut.results[0].permalink.absoluteString, "https://foo.com./image")
        XCTAssertEqual(sut.results[0].buyingMode.rawValue, "buy_it_now")
        XCTAssertEqual(sut.results[0].siteId, "foo.results.0.site_id")
        XCTAssertEqual(sut.results[0].categoryId, "foo.results.0.category_id")
        XCTAssertEqual(sut.results[0].domainId, "foo.results.0.domain_id")
        XCTAssertEqual(sut.results[0].thumbnail.absoluteString, "http://foo.com/image.jpg")
        XCTAssertEqual(sut.results[0].currencyId, "foo.results.0.currency_id")
        XCTAssertEqual(sut.results[0].price, 179990.0)
        XCTAssertEqual(sut.results[0].originalPrice, 11111.1)
        XCTAssertEqual(sut.results[0].salePrice, 22222.2)
        XCTAssertEqual(sut.results[0].soldQuantity, 1)
        XCTAssertEqual(sut.results[0].availableQuantity, 1)
        XCTAssertTrue(sut.results[0].acceptsMercadopago)
        XCTAssertEqual(sut.results[0].tags[0], "foo.results.0.tags.0")
        XCTAssertEqual(sut.results[0].tags[1], "foo.results.0.tags.1")
        XCTAssertFalse(sut.results[0].shipping.storePickUp)
        XCTAssertTrue(sut.results[0].shipping.freeShipping)
        XCTAssertEqual(sut.results[0].shipping.logisticType, "foo.results.0.shipping.logistic_type")
        XCTAssertEqual(sut.results[0].shipping.mode, "foo.results.0.shipping.mode")
        XCTAssertEqual(sut.results[0].shipping.tags[0], "foo.results.0.shipping.tags.0")
        XCTAssertEqual(sut.results[0].shipping.tags[1], "foo.results.0.shipping.tags.1")
    }
}
