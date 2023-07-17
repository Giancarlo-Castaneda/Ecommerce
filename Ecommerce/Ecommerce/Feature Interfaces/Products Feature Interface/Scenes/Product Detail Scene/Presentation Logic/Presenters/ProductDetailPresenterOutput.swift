import Foundation

public protocol ProductDetailPresenterOutput: AnyObject {

    @MainActor func configure(state: ProductDetailViewState)
    @MainActor func configure(title: String)
}

public enum ProductDetailViewState {
    case content
    case failure(title: String, message: String)
    case loading
}
