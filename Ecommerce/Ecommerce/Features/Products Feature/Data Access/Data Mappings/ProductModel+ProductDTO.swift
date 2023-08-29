import Foundation

extension ProductModel {

    init(_ dto: ProductDTO) {
        let detail = ProductDetailModel(dto.body)

        self.init(code: dto.code, detail: detail)
    }
}
