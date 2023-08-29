import Foundation

public protocol ProductSpecViewModel {

    func accept<Visitor: ProductSpecsViewModelVisitor>(visitor: Visitor) -> Visitor.ReturnValue
}
