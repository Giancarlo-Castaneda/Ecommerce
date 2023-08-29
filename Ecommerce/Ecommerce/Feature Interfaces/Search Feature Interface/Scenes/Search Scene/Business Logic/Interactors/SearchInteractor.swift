import Foundation

public protocol SearchInteractor {

    func search(query: String)
}

public protocol SearchInteractorOutput {
    func loading() async
    func searched(items: [SearchItemModel]) async
    func error(_ error: Error) async
}
