import Ecommerce
import Foundation

final class MockSearchDataProvider: SearchDataProvider, Mockable {

    // MARK: - Invocation

    enum Invocation {
        case numberOfSections
        case numberOfItems
        case viewModel
    }

    // MARK: - Stubs

    var receivedSection: Int?
    var receivedIndexPath: IndexPath?

    // MARK: - Internal Methods

    func numberOfSections() -> Int {
        append(.numberOfSections)

        return getStubValue(for: .numberOfSections)
    }

    func numberOfItems(inSection section: Int) -> Int {
        append(.numberOfItems)

        receivedSection = section

        return getStubValue(for: .numberOfItems)
    }

    func viewModel(at indexPath: IndexPath) -> SearchItemViewModel? {
        append(.viewModel)

        receivedIndexPath = indexPath

        return getStubValue(for: .viewModel)
    }
}
