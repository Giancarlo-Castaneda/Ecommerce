import Ecommerce
import Foundation

final class MockSearchDataProviderFactory: SearchDataProviderFactory, Mockable {

    // MARK: - Invocation

    enum Invocation {
        case makeSearchDataProvider
    }

    // MARK: - Stubs

    var receivedItems: [SearchItemModel] = []

    // MARK: - Internal Methods

    func makeSearchDataProvider(items: [SearchItemModel]) -> SearchDataProvider {
        append(.makeSearchDataProvider)

        receivedItems = items

        return getStubValue(for: .makeSearchDataProvider)
    }
}
