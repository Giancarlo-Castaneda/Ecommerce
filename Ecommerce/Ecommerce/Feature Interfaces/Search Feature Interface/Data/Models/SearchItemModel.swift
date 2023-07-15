import Foundation

public struct SearchItemModel {

    // MARK: - Public Properties

    public let id: SearchItemID
    public let title: String
    public let condition: String
    public let listingKind: ListingKind
    public let permalink: URL
    public let buyingKind: BuyingKind
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
    public let shipping: ShippingModel
    public let seller: SellerModel
    public let sellerAddress: SellerAddressModel
    public let address: AddressModel

    // MARK: - Initialization

    public init(id: SearchItemID,
                title: String,
                condition: String,
                listingKind: ListingKind,
                permalink: URL,
                buyingKind: BuyingKind,
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
                shipping: ShippingModel,
                seller: SellerModel,
                sellerAddress: SellerAddressModel,
                address: AddressModel) {

        self.id = id
        self.title = title
        self.condition = condition
        self.listingKind = listingKind
        self.permalink = permalink
        self.buyingKind = buyingKind
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
