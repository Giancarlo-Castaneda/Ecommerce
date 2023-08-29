import Foundation

public protocol ProductDetailInteractor {

    func fetchDetail(id: SearchItemID)
}

public protocol ProductDetailInteractorOutput {
    func loading() async
    func fetchedDetail(detail: ProductDetailModel) async
    func error(_ error: Error) async
}
