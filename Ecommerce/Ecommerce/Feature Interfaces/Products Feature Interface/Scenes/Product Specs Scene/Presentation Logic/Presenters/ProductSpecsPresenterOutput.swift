import Foundation

public protocol ProductSpecsPresenterOutput: AnyObject {

    @MainActor func configure(state: ProductSpecsViewState)
}

public enum ProductSpecsViewState {
    case content(dataProvider: ProductSpecDataProvider)
    case failure(title: String, message: String)
    case loading
}
