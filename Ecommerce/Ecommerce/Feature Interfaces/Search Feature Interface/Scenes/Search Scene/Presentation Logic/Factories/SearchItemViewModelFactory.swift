import Foundation

public protocol SearchItemViewModelFactory {

    func makeSearchItemViewModel(item: SearchItemModel, numberFormatter: NumberFormatter) -> SearchItemViewModel
}
