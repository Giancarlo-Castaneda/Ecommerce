import Foundation

public struct ProductDTO: Decodable {
    public let code: Int
    public let body: Body

    public init(code: Int, body: Body) {
        self.code = code
        self.body = body
    }
}

public extension ProductDTO {

    // MARK: - Body

    struct Body: Decodable {
        public let id: SearchItemID
        public let sellerId: Int
        public let siteId: String
        public let title: String
        public let condition: String
        public let listingTypeId: SearchDTO.Result.ListingTypeId
        public let permalink: URL
        public let categoryId: String
        public let currencyId: String
        public let price: Double
        public let originalPrice: Double?
        public let salePrice: Double?
        public let soldQuantity: Int
        public let availableQuantity: Int
        public let acceptsMercadopago: Bool
        public let tags: [String]
        public let shipping: SearchDTO.Result.Shipping
        public let dateCreated: Date
        public let lastUpdated: Date
        public let warranty: String
        public let pictures: [Picture]
        public let attributes: [Attribute]

        public init(id: SearchItemID,
                    sellerId: Int,
                    siteId: String,
                    title: String,
                    condition: String,
                    listingTypeId: SearchDTO.Result.ListingTypeId,
                    permalink: URL,
                    categoryId: String,
                    currencyId: String, price: Double,
                    originalPrice: Double?,
                    salePrice: Double?,
                    soldQuantity: Int,
                    availableQuantity: Int,
                    acceptsMercadopago: Bool,
                    tags: [String],
                    shipping: SearchDTO.Result.Shipping,
                    dateCreated: Date,
                    lastUpdated: Date,
                    warranty: String,
                    pictures: [Picture],
                    attributes: [Attribute]) {

            self.id = id
            self.sellerId = sellerId
            self.siteId = siteId
            self.title = title
            self.condition = condition
            self.listingTypeId = listingTypeId
            self.permalink = permalink
            self.categoryId = categoryId
            self.currencyId = currencyId
            self.price = price
            self.originalPrice = originalPrice
            self.salePrice = salePrice
            self.soldQuantity = soldQuantity
            self.availableQuantity = availableQuantity
            self.acceptsMercadopago = acceptsMercadopago
            self.tags = tags
            self.shipping = shipping
            self.dateCreated = dateCreated
            self.lastUpdated = lastUpdated
            self.warranty = warranty
            self.pictures = pictures
            self.attributes = attributes
        }
    }

    // MARK: - Picture

    struct Picture: Decodable {
        public let id: String
        public let url: URL
        public let secureUrl: URL
        public let size: String
        public let maxSize: String

        public init(id: String, url: URL, secureUrl: URL, size: String, maxSize: String) {
            self.id = id
            self.url = url
            self.secureUrl = secureUrl
            self.size = size
            self.maxSize = maxSize
        }
    }

    struct Attribute: Decodable {
        public let id: String
        public let name: String
        public let valueId: String?
        public let valueName: String?

        public init(id: String, name: String, valueId: String?, valueName: String?) {
            self.id = id
            self.name = name
            self.valueId = valueId
            self.valueName = valueName
        }
    }
}
