import Ecommerce
import Foundation

final class MockSearchItemViewModelFactory: SearchItemViewModelFactory, Mockable {

    // MARK: - Invocation

    enum Invocation {
        case makeSearchItemViewModel
    }

    // MARK: - Stubs

    var receivedItem: SearchItemModel?
    var receivedNumberFormatter: NumberFormatter?

    // MARK: - Internal Methods

    func makeSearchItemViewModel(item: SearchItemModel, numberFormatter: NumberFormatter) -> SearchItemViewModel {
        append(.makeSearchItemViewModel)

        receivedItem = item
        receivedNumberFormatter = numberFormatter

        return getStubValue(for: .makeSearchItemViewModel) ?? MockSearchItemViewModel(id: item.id, title: item.title)
    }
}
