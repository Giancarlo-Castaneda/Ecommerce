import Foundation

public protocol ProductSpecsViewModelVisitor {

    associatedtype ReturnValue

    func visit(_ viewModel: ProductSpecHeaderViewModel) -> ReturnValue
    func visit(_ viewModel: ProductSpecAttributeViewModel) -> ReturnValue
}
