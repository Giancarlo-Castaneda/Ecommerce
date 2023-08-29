import XCTest

@testable import Ecommerce

final class ConcreteSearchDataProviderTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteSearchDataProvider

    // MARK: Private Properties

    private var sut: SUT!
    private var mockViewModelFactory: MockSearchItemViewModelFactory!
    private var mockNumberFormatter: NumberFormatter!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockViewModelFactory = .init()
        mockNumberFormatter = Helper.makeNumberFormatter()
    }

    override func tearDown() {
        super.tearDown()

        mockViewModelFactory = nil
        mockNumberFormatter = nil
        sut = nil
    }

    // MARK: Tests

    func test_numberOfSections_shouldReturnValue() throws {
        let item = try Helper.makeSearchItemModel()

        sut = SUT(searchItems: [item, item, item],
                  viewModelFactory: mockViewModelFactory,
                  numberFormatter: mockNumberFormatter)

        XCTAssertEqual(sut.numberOfSections(), 1)
    }

    func test_numberOfItems_shouldReturnValue() throws {
        let item = try Helper.makeSearchItemModel()

        sut = SUT(searchItems: [item, item],
                  viewModelFactory: mockViewModelFactory,
                  numberFormatter: mockNumberFormatter)

        XCTAssertEqual(sut.numberOfItems(inSection: 0), 2)
    }

    func test_numberOfItems_whenSectionOutOfRange_shouldReturnZero() throws {
        let item = try Helper.makeSearchItemModel()

        sut = SUT(searchItems: [item, item],
                  viewModelFactory: mockViewModelFactory,
                  numberFormatter: mockNumberFormatter)

        XCTAssertEqual(sut.numberOfItems(inSection: 111), 0)
    }

    func test_viewModel_shouldReturnViewModel() throws {
        let item1 = try Helper.makeSearchItemModel(title: "foo.title.0")
        let item2 = try Helper.makeSearchItemModel(title: "foo.title.1")

        sut = SUT(searchItems: [item1, item2],
                  viewModelFactory: mockViewModelFactory,
                  numberFormatter: mockNumberFormatter)

        XCTAssertEqual(sut.viewModel(at: IndexPath(item: 0, section: 0))?.title, "foo.title.0")
        XCTAssertEqual(sut.viewModel(at: IndexPath(item: 1, section: 0))?.title, "foo.title.1")
    }

    func test_viewModel_whenIndexPathOutOfRange_shouldReturnNil() throws {
        let item = try Helper.makeSearchItemModel()

        sut = SUT(searchItems: [item, item],
                  viewModelFactory: mockViewModelFactory,
                  numberFormatter: mockNumberFormatter)

        XCTAssertNil(sut.viewModel(at: IndexPath(row: 111, section: 222)))
    }
}
