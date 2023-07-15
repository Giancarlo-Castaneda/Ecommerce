import Ecommerce
import Foundation
import XCTest

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

    static func makeSearchItemModel(id: SearchItemID = SearchItemID(""),
                                    title: String = "",
                                    condition: String = "",
                                    listingKind: ListingKind = .goldPro,
                                    permalink: URL? = nil,
                                    buyingKind: BuyingKind = .buyItNow,
                                    siteId: String = "",
                                    categoryId: String = "",
                                    domainId: String = "",
                                    thumbnail: URL? = nil,
                                    currencyId: String = "",
                                    price: Double = 0.0,
                                    originalPrice: Double? = nil,
                                    salePrice: Double? = nil,
                                    soldQuantity: Int = 0,
                                    availableQuantity: Int = 0,
                                    acceptsMercadopago: Bool = false,
                                    tags: [String] = [],
                                    shipping: ShippingModel? = nil,
                                    seller: SellerModel? = nil,
                                    sellerAddress: SellerAddressModel? = nil,
                                    address: AddressModel? = nil) throws -> SearchItemModel {

        let permalink = try permalink ?? XCTUnwrap(URL(string: "http://foo.permalink.com"))
        let thumbnail = try thumbnail ?? XCTUnwrap(URL(string: "http://foo.thumbnail.com"))
        let shipping = shipping ?? makeShippingModel()
        let seller = try seller ?? makeSellerModel()
        let sellerAddress = sellerAddress ?? makeSellerAddressModel()
        let address = address ?? makeAddressModel()

        return SearchItemModel(id: id,
                               title: title,
                               condition: condition,
                               listingKind: listingKind,
                               permalink: permalink,
                               buyingKind: buyingKind,
                               siteId: siteId,
                               categoryId: categoryId,
                               domainId: domainId,
                               thumbnail: thumbnail,
                               currencyId: currencyId,
                               price: price,
                               originalPrice: originalPrice,
                               salePrice: salePrice,
                               soldQuantity: soldQuantity,
                               availableQuantity: availableQuantity,
                               acceptsMercadopago: acceptsMercadopago,
                               tags: tags,
                               shipping: shipping,
                               seller: seller,
                               sellerAddress: sellerAddress,
                               address: address)
    }

    static func makeAddressModel(stateId: String = "",
                                 stateName: String = "",
                                 cityId: String? = nil,
                                 cityName: String = "") -> AddressModel {

        AddressModel(stateId: stateId, stateName: stateName, cityId: cityId, cityName: cityName)
    }

    static func makeSellerAddressModel(comment: String = "",
                                       addressLine: String = "",
                                       id: Double? = nil,
                                       latitude: Double? = nil,
                                       longitude: Double? = nil,
                                       country: LocationCommonModel? = nil,
                                       state: LocationCommonModel? = nil,
                                       city: LocationCommonModel? = nil) -> SellerAddressModel {

        let country = country ?? makeLocationCommonModel()
        let state = state ?? makeLocationCommonModel()
        let city = city ?? makeLocationCommonModel()

        return SellerAddressModel(comment: comment,
                                  addressLine: addressLine,
                                  id: id,
                                  latitude: latitude,
                                  longitude: longitude,
                                  country: country,
                                  state: state,
                                  city: city)
    }

    static func makeLocationCommonModel(id: String? = nil, name: String = "") -> LocationCommonModel {
        LocationCommonModel(id: id, name: name)
    }

    static func makeSellerModel(id: Int = 0,
                                nickname: String = "",
                                carDealer: Bool = false,
                                realEstateAgency: Bool = false,
                                registrationDate: Date = .now,
                                tags: [String] = [],
                                permalink: URL? = nil,
                                sellerReputation: SellerReputationModel? = nil) throws -> SellerModel {

        let permalink = try permalink ?? XCTUnwrap(URL(string: "http://foo.permalink.com"))
        let sellerReputation = sellerReputation ?? makeSellerReputationModel()

        return SellerModel(id: id,
                           nickname: nickname,
                           carDealer: carDealer,
                           realEstateAgency: realEstateAgency,
                           registrationDate: registrationDate,
                           tags: tags,
                           permalink: permalink,
                           sellerReputation: sellerReputation)
    }

    static func makeSellerReputationModel(sellerLevelKind: SellerLevelKind = .the5_Green,
                                          sellerPowerKind: SellerPowerKind = .gold,
                                          transaction: TransactionsModel? = nil,
                                          metric: MetricsModel? = nil) -> SellerReputationModel {

        let transaction = transaction ?? makeTransactionsModel()
        let metric = metric ?? makeMetricsModel()

        return SellerReputationModel(sellerLevelKind: sellerLevelKind,
                              sellerPowerKind: sellerPowerKind,
                              transaction: transaction,
                              metric: metric)
    }

    static func makeMetricsModel(sale: SaleModel? = nil,
                                 claim: MetricDetailModel? = nil,
                                 delayedHandlingTime: MetricDetailModel? = nil,
                                 cancellation: MetricDetailModel? = nil) -> MetricsModel {

        let sale = sale ?? makeSaleModel()
        let claim = claim ?? makeMetricDetailModel()
        let delayedHandlingTime = delayedHandlingTime ?? makeMetricDetailModel()
        let cancellation = cancellation ?? makeMetricDetailModel()

        return MetricsModel(sale: sale,
                            claim: claim,
                            delayedHandlingTime: delayedHandlingTime,
                            cancellation: cancellation)
    }

    static func makeMetricDetailModel(period: String = "", rate: Double = 0.0, value: Int = 0) -> MetricDetailModel {
        MetricDetailModel(period: period, rate: rate, value: value)
    }

    static func makeSaleModel(period: String = "", completed: Int = 0) -> SaleModel {
        SaleModel(period: period, completed: completed)
    }

    static func makeTransactionsModel(canceled: Int = 0,
                                      completed: Int = 0,
                                      period: String = "",
                                      rating: RatingsModel? = nil,
                                      total: Int = 0) -> TransactionsModel {

        let rating = rating ?? makeRatingsModel()

        return TransactionsModel(canceled: canceled, completed: completed, period: period, rating: rating, total: total)
    }

    static func makeShippingModel(storePickUp: Bool = false,
                                  freeShipping: Bool = false,
                                  logisticType: String = "",
                                  mode: String = "",
                                  tags: [String] = []) -> ShippingModel {

        ShippingModel(storePickUp: storePickUp,
                      freeShipping: freeShipping,
                      logisticType: logisticType,
                      mode: mode,
                      tags: tags)
    }

    static func makePagingModel(totalResults: Int = 0,
                                primaryResults: Int = 0,
                                offset: Int = 0,
                                limit: Int = 0) -> PagingModel {

        PagingModel(totalResults: totalResults, primaryResults: primaryResults, offset: offset, limit: limit)
    }

    static func makeRatingsModel(negative: Double = 0.0,
                                 neutral: Double = 0.0,
                                 positive: Double = 0.0) -> RatingsModel {

        RatingsModel(negative: negative, neutral: neutral, positive: positive)
    }
}
