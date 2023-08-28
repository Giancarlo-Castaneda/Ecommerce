import Foundation

public protocol ProductSpecDataProvider {

    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func viewModel(at indexPath: IndexPath) -> ProductSpecViewModel?
}
