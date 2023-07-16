import Foundation

final class ConcreteSearchItemViewModelFactory: SearchItemViewModelFactory {

    // MARK: - Internal Methods

    func makeSearchItemViewModel(item: SearchItemModel, numberFormatter: NumberFormatter) -> SearchItemViewModel {
        ConcreteSearchItemViewModel(searchItem: item, numberFormatter: numberFormatter)
    }
}
