import Foundation

public protocol ProductSpecsInteractor {

    func fetchSpecs(id: SearchItemID)
}

public protocol ProductSpecsInteractorOutput {
    func loading() async
    func fetchedSpecs(detail: ProductDetailModel) async
    func error(_ error: Error) async
}
