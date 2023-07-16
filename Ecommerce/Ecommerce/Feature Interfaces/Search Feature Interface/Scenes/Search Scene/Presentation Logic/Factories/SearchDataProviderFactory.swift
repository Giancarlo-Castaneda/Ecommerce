import Foundation

public protocol SearchDataProviderFactory {

    func makeSearchDataProvider(items: [SearchItemModel]) -> SearchDataProvider
}
