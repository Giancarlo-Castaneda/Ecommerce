import Foundation

public protocol ProductSpecAttributeViewModel: ProductSpecViewModel {

    // MARK: - Public Properties

    var name: String { get }
    var value: String? { get }
}

// MARK: - ProductSpecsViewModelVisitor

extension ProductSpecAttributeViewModel {

    public func accept<Visitor: ProductSpecsViewModelVisitor>(visitor: Visitor) -> Visitor.ReturnValue {
        visitor.visit(self)
    }
}
