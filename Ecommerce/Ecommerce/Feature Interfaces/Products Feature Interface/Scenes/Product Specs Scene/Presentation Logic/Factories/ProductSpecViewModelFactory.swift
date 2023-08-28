import Foundation

public protocol ProductSpecViewModelFactory {

    func makeProductSpecAttributeViewModel(attribute: AttributeModel) -> ProductSpecViewModel
    func makeProductSpecHeaderViewModel(detail: ProductDetailModel,
                                        numberFormatter: NumberFormatter) -> ProductSpecViewModel
}
