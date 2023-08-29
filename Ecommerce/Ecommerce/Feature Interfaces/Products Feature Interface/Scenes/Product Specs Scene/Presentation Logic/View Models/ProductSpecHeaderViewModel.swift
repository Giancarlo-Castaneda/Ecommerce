import Foundation

public protocol ProductSpecHeaderViewModel: ProductSpecViewModel {

    // MARK: - Internal Properties

    var title: String { get }
    var price: String { get }
    var originalPrice: String? { get }
}
