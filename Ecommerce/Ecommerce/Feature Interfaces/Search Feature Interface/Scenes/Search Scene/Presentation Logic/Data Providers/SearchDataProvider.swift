import Foundation

public protocol SearchDataProvider {

    func numberOfSections() -> Int
    func numberOfItems(inSection section: Int) -> Int
    func viewModel(at indexPath: IndexPath) -> SearchItemViewModel?
}
