import Foundation

final class ConcreteSearchDataProvider: SearchDataProvider {

    // MARK: - Private Properties

    private lazy var items = generateItems()
    private let searchItems: [SearchItemModel]
    private let viewModelFactory: SearchItemViewModelFactory
    private let numberFormatter: NumberFormatter

    // MARK: - Initialization

    init(searchItems: [SearchItemModel],
         viewModelFactory: SearchItemViewModelFactory,
         numberFormatter: NumberFormatter) {

        self.searchItems = searchItems
        self.viewModelFactory = viewModelFactory
        self.numberFormatter = numberFormatter
    }

    // MARK: - Private Methods

    private func generateItems() -> [SearchItemViewModel] {
        searchItems.map { viewModelFactory.makeSearchItemViewModel(item: $0, numberFormatter: numberFormatter) }
    }

    // MARK: - Internal Methods

    func numberOfSections() -> Int {
        1
    }

    func numberOfItems(inSection section: Int) -> Int {
        guard
            (0..<numberOfSections()) ~= section
        else { return 0 }

        return items.count
    }

    func viewModel(at indexPath: IndexPath) -> SearchItemViewModel? {
        guard
            (0..<numberOfSections()) ~= indexPath.section,
            (0..<numberOfItems(inSection: indexPath.section)) ~= indexPath.item
        else { return nil }

        return items[indexPath.item]
    }
}
