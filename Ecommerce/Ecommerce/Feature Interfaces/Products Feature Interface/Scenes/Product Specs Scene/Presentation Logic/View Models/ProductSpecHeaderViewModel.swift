import Foundation

public protocol ProductSpecHeaderViewModel: ProductSpecViewModel {

    // MARK: - Public Properties

    var title: String { get }
    var price: String { get }
    var originalPrice: String? { get }
}

// MARK: - ProductSpecsViewModelVisitor

extension ProductSpecHeaderViewModel {

    public func accept<Visitor: ProductSpecsViewModelVisitor>(visitor: Visitor) -> Visitor.ReturnValue {
        visitor.visit(self)
    }
}
