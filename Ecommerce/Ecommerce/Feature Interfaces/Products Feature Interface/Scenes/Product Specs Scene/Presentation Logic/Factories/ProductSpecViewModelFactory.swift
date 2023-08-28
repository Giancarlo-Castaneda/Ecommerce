import Foundation

public protocol ProductSpecViewModelFactory {

    func makeProductSpecHeaderViewModel(detail: ProductDetailModel,
                                        numberFormatter: NumberFormatter) -> ProductSpecViewModel
}
