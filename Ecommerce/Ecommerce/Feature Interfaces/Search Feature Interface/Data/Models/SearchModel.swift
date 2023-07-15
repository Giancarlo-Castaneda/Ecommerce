import Foundation

public struct SearchModel {

    // MARK: - Public Properties

    public let siteId: String
    public let timeZone: String
    public let paging: PagingModel
    public let items: [SearchItemModel]

    // MARK: - Initialization

    public init(siteId: String, timeZone: String, paging: PagingModel, items: [SearchItemModel]) {
        self.siteId = siteId
        self.timeZone = timeZone
        self.paging = paging
        self.items = items
    }
}
