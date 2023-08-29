import Foundation

final class ConcreteSearchDataProviderFactory: SearchDataProviderFactory {

    // MARK: - Private Properties

    private let viewModelFactory: SearchItemViewModelFactory
    private let numberFormatter: NumberFormatter

    // MARK: - Initialization

    init(viewModelFactory: SearchItemViewModelFactory, numberFormatter: NumberFormatter) {
        self.viewModelFactory = viewModelFactory
        self.numberFormatter = numberFormatter
    }

    // MARK: - Internal Methods

    func makeSearchDataProvider(items: [SearchItemModel]) -> SearchDataProvider {
        ConcreteSearchDataProvider(searchItems: items,
                                   viewModelFactory: viewModelFactory,
                                   numberFormatter: numberFormatter)
    }
}
