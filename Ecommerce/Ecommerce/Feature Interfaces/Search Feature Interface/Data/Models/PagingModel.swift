import Foundation

public struct PagingModel {

    // MARK: - Public Properties

    public let totalResults: Int
    public let primaryResults: Int
    public let offset: Int
    public let limit: Int

    // MARK: - Initialization

    public init(totalResults: Int, primaryResults: Int, offset: Int, limit: Int) {
        self.totalResults = totalResults
        self.primaryResults = primaryResults
        self.offset = offset
        self.limit = limit
    }
}
