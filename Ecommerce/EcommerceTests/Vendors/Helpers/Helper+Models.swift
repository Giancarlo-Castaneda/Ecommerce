import Ecommerce
import Foundation

extension Helper {

    static func makeSearchDTO(siteId: String = "",
                              countryDefaultTimeZone: String = "",
                              paging: SearchDTO.Paging? = nil,
                              results: [SearchDTO.Result] = []) -> SearchDTO {

        let paging = paging ?? makePaging()

        return SearchDTO(siteId: siteId,
                         countryDefaultTimeZone: countryDefaultTimeZone,
                         paging: paging,
                         results: results)
    }

    static func makePaging(total: Int = 0,
                           primaryResults: Int = 0,
                           offset: Int = 0,
                           limit: Int = 0) -> SearchDTO.Paging {

        SearchDTO.Paging(total: total, primaryResults: primaryResults, offset: offset, limit: limit)
    }

    static func makeSearchModel(siteId: String = "",
                                timeZone: String = "",
                                paging: PagingModel? = nil,
                                items: [SearchItemModel] = []) -> SearchModel {

        let paging = paging ?? makePagingModel()

        return SearchModel(siteId: siteId, timeZone: timeZone, paging: paging, items: items)
    }

    static func makePagingModel(totalResults: Int = 0,
                                primaryResults: Int = 0,
                                offset: Int = 0,
                                limit: Int = 0) -> PagingModel {

        PagingModel(totalResults: totalResults, primaryResults: primaryResults, offset: offset, limit: limit)
    }
}
