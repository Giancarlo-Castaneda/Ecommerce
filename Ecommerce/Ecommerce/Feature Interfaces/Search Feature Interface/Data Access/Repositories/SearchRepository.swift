import Foundation

public protocol SearchRepository {

    func search(query: String, siteId: String, offset: Int, limit: Int) async throws -> SearchModel
}
