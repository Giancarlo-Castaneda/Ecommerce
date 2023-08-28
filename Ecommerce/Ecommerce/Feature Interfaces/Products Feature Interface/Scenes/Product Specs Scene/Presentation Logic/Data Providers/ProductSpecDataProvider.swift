import Foundation

public protocol ProductSpecDataProvider {

    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func titleForHeader(inSection section: Int) -> String?
    func viewModel(at indexPath: IndexPath) -> ProductSpecViewModel?
}
