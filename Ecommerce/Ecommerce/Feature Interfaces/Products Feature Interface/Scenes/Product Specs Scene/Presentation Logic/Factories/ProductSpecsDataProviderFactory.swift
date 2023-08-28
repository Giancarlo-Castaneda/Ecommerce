import Foundation

public protocol ProductSpecsDataProviderFactory {

    func makeProductSpecsDataProvider(detail: ProductDetailModel) -> ProductSpecDataProvider
}
