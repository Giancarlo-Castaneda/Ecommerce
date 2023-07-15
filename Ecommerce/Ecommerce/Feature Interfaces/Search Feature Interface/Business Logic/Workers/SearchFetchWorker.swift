import Foundation

public protocol SearchFetchWorker {

    func execute(query: String, siteId: String, offset: Int, limit: Int) async throws -> SearchModel
}
