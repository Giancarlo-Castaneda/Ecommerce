import Foundation

public protocol ProductFetchDetailWorker {

    func execute(id: SearchItemID) async throws -> ProductModel
}
