import Foundation

public struct ProductModel {

    // MARK: - Public Properties

    public let code: Int
    public let detail: ProductDetailModel

    // MARK: - Initialization

    public init(code: Int, detail: ProductDetailModel) {
        self.code = code
        self.detail = detail
    }
}
