import Foundation

public struct ProductDetailModel {

    // MARK: - Public Properties

    public let sellerId: Int
    public let siteId: String
    public let title: String
    public let condition: String
    public let listingKind: ListingKind
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
    public let shipping: ShippingModel
    public let dateCreated: Date
    public let lastUpdated: Date
    public let warranty: String
    public let pictures: [PictureModel]
    public let attributes: [AttributeModel]

    // MARK: - Initialization

    public init(sellerId: Int,
                siteId: String,
                title: String,
                condition: String,
                listingKind: ListingKind,
                permalink: URL,
                categoryId: String,
                currencyId: String,
                price: Double,
                originalPrice: Double?,
                salePrice: Double?,
                soldQuantity: Int,
                availableQuantity: Int,
                acceptsMercadopago: Bool,
                tags: [String],
                shipping: ShippingModel,
                dateCreated: Date,
                lastUpdated: Date,
                warranty: String,
                pictures: [PictureModel],
                attributes: [AttributeModel]) {

        self.sellerId = sellerId
        self.siteId = siteId
        self.title = title
        self.condition = condition
        self.listingKind = listingKind
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
