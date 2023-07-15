import Foundation

extension SearchModel {

    init(_ dto: SearchDTO) {
        let paging = PagingModel(dto.paging)
        let items = dto.results.map { SearchItemModel($0) }

        self.init(siteId: dto.siteId, timeZone: dto.countryDefaultTimeZone, paging: paging, items: items)
    }
}
