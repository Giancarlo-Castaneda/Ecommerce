import Foundation

extension PagingModel {

    init(_ dto: SearchDTO.Paging) {
        self.init(totalResults: dto.total, primaryResults: dto.primaryResults, offset: dto.offset, limit: dto.limit)
    }
}
