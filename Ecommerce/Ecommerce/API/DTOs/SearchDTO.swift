import Foundation

public struct SearchDTO: Decodable {
    public let siteId: String
    public let countryDefaultTimeZone: String
    public let paging: Paging
    public let results: [Result]

    public init(siteId: String, countryDefaultTimeZone: String, paging: Paging, results: [Result]) {
        self.siteId = siteId
        self.countryDefaultTimeZone = countryDefaultTimeZone
        self.paging = paging
        self.results = results
    }
}

public extension SearchDTO {

    // MARK: - Paging

    struct Paging: Decodable {
        public let total: Int
        public let primaryResults: Int
        public let offset: Int
        public let limit: Int

        public init(total: Int, primaryResults: Int, offset: Int, limit: Int) {
            self.total = total
            self.primaryResults = primaryResults
            self.offset = offset
            self.limit = limit
        }
    }

    // MARK: - SearchItem

    struct Result: Decodable {
        public let id: SearchItemID
        public let title: String
        public let condition: String
        public let listingTypeId: ListingTypeId
        public let permalink: URL
        public let buyingMode: BuyingMode
        public let siteId: String
        public let categoryId: String
        public let domainId: String
        public let thumbnail: URL
        public let currencyId: String
        public let price: Double
        public let originalPrice: Double?
        public let salePrice: Double?
        public let soldQuantity: Int
        public let availableQuantity: Int
        public let acceptsMercadopago: Bool
        public let tags: [String]
        public let shipping: Shipping
        public let seller: Seller
        public let sellerAddress: SellerAddress
        public let address: Address

        public init(id: SearchItemID,
                    title: String,
                    condition: String,
                    listingTypeId: ListingTypeId,
                    permalink: URL,
                    buyingMode: BuyingMode,
                    siteId: String,
                    categoryId: String,
                    domainId: String,
                    thumbnail: URL,
                    currencyId: String,
                    price: Double,
                    originalPrice: Double?,
                    salePrice: Double?,
                    soldQuantity: Int,
                    availableQuantity: Int,
                    acceptsMercadopago: Bool,
                    tags: [String],
                    shipping: Shipping,
                    seller: Seller,
                    sellerAddress: SellerAddress,
                    address: Address) {

            self.id = id
            self.title = title
            self.condition = condition
            self.listingTypeId = listingTypeId
            self.permalink = permalink
            self.buyingMode = buyingMode
            self.siteId = siteId
            self.categoryId = categoryId
            self.domainId = domainId
            self.thumbnail = thumbnail
            self.currencyId = currencyId
            self.price = price
            self.originalPrice = originalPrice
            self.salePrice = salePrice
            self.soldQuantity = soldQuantity
            self.availableQuantity = availableQuantity
            self.acceptsMercadopago = acceptsMercadopago
            self.tags = tags
            self.shipping = shipping
            self.seller = seller
            self.sellerAddress = sellerAddress
            self.address = address
        }
    }
}

public extension SearchDTO.Result {

    enum BuyingMode: String, Decodable {
        case buyItNow = "buy_it_now"
    }

    enum ListingTypeId: String, Decodable {
        case goldPro = "gold_pro"
        case goldSpecial = "gold_special"
    }

    // MARK: - Shipping

    struct Shipping: Decodable {
        public let storePickUp: Bool
        public let freeShipping: Bool
        public let logisticType: String
        public let mode: String
        public let tags: [String]

        public init(storePickUp: Bool, freeShipping: Bool, logisticType: String, mode: String, tags: [String]) {
            self.storePickUp = storePickUp
            self.freeShipping = freeShipping
            self.logisticType = logisticType
            self.mode = mode
            self.tags = tags
        }
    }

    // MARK: - Seller

    struct Seller: Decodable {
        public let id: Int
        public let nickname: String
        public let carDealer: Bool
        public let realEstateAgency: Bool
        public let registrationDate: Date
        public let tags: [String]
        public let permalink: URL
        public let sellerReputation: SellerReputation

        public init(id: Int,
                    nickname: String,
                    carDealer: Bool,
                    realEstateAgency: Bool,
                    registrationDate: Date,
                    tags: [String],
                    permalink: URL,
                    sellerReputation: SellerReputation) {

            self.id = id
            self.nickname = nickname
            self.carDealer = carDealer
            self.realEstateAgency = realEstateAgency
            self.registrationDate = registrationDate
            self.tags = tags
            self.permalink = permalink
            self.sellerReputation = sellerReputation
        }
    }

    // MARK: - SellerAddress

    struct SellerAddress: Decodable {
        public let comment: String
        public let addressLine: String
        public let id: Double?
        public let latitude: Double?
        public let longitude: Double?
        public let country: Sort
        public let state: Sort
        public let city: Sort

        public init(comment: String,
                    addressLine: String,
                    id: Double?,
                    latitude: Double?,
                    longitude: Double?,
                    country: Sort,
                    state: Sort,
                    city: Sort) {

            self.comment = comment
            self.addressLine = addressLine
            self.id = id
            self.latitude = latitude
            self.longitude = longitude
            self.country = country
            self.state = state
            self.city = city
        }
    }

    // MARK: - Address

    struct Address: Decodable {
        public let stateId: String
        public let stateName: String
        public let cityId: String?
        public let cityName: String

        public init(stateId: String, stateName: String, cityId: String?, cityName: String) {
            self.stateId = stateId
            self.stateName = stateName
            self.cityId = cityId
            self.cityName = cityName
        }
    }
}

public extension SearchDTO.Result.Seller {

    // MARK: - SellerReputation

    struct SellerReputation: Decodable {
        public let levelId: LevelId
        public let powerSellerStatus: PowerSellerStatus
        public let transactions: Transactions
        public let metrics: Metrics

        public init(levelId: LevelId, powerSellerStatus: PowerSellerStatus, transactions: Transactions, metrics: Metrics) {
            self.levelId = levelId
            self.powerSellerStatus = powerSellerStatus
            self.transactions = transactions
            self.metrics = metrics
        }
    }
}

public extension SearchDTO.Result.SellerAddress {

    // MARK: - Sort

    struct Sort: Decodable {
        public let id: String?
        public let name: String

        public init(id: String?, name: String) {
            self.id = id
            self.name = name
        }
    }
}


public extension SearchDTO.Result.Seller.SellerReputation {

    enum LevelId: String, Decodable {
        case the5_Green = "5_green"
    }

    enum PowerSellerStatus: String, Decodable {
        case gold
        case platinum
    }

    // MARK: - Metrics

    struct Metrics: Decodable {

        public let sales: Sales
        public let claims: MetricDetail
        public let delayedHandlingTime: MetricDetail
        public let cancellations: MetricDetail

        public init(sales: Sales,
                    claims: MetricDetail,
                    delayedHandlingTime: MetricDetail,
                    cancellations: MetricDetail) {

            self.sales = sales
            self.claims = claims
            self.delayedHandlingTime = delayedHandlingTime
            self.cancellations = cancellations
        }
    }

    // MARK: - Transactions

    struct Transactions: Decodable {
        public let canceled: Int
        public let completed: Int
        public let period: String
        public let ratings: Ratings
        public let total: Int

        public init(canceled: Int, completed: Int, period: String, ratings: Ratings, total: Int) {
            self.canceled = canceled
            self.completed = completed
            self.period = period
            self.ratings = ratings
            self.total = total
        }
    }
}

public extension SearchDTO.Result.Seller.SellerReputation.Transactions {

    // MARK: - Ratings

    struct Ratings: Decodable {
        public let negative: Double
        public let neutral: Double
        public let positive: Double

        public init(negative: Double, neutral: Double, positive: Double) {
            self.negative = negative
            self.neutral = neutral
            self.positive = positive
        }
    }
}

public extension SearchDTO.Result.Seller.SellerReputation.Metrics {

    // MARK: - Cancellations

    struct MetricDetail: Decodable {

        public let period: String
        public let rate: Double
        public let value: Int

        public init(period: String, rate: Double, value: Int) {
            self.period = period
            self.rate = rate
            self.value = value
        }
    }

    // MARK: - Sales

    struct Sales: Decodable {
        public let period: String
        public let completed: Int

        public init(period: String, completed: Int) {
            self.period = period
            self.completed = completed
        }
    }
}
