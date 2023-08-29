import Foundation

public protocol ProductRepository {

    func fetchItem(id: SearchItemID) async throws -> ProductModel
}
