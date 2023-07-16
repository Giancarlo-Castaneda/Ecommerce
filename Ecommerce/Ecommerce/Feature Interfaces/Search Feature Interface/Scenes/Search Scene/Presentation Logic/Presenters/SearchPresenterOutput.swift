import Foundation

public protocol SearchPresenterOutput: AnyObject {

    @MainActor func configure(state: SearchViewState)
}

public enum SearchViewState {
    case content(dataProvider: SearchDataProvider)
    case failure(title: String, message: String)
    case loading
}
