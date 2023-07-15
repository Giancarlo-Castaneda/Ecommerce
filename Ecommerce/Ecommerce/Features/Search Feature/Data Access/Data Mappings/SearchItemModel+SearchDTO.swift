import Foundation

extension SearchItemModel {

    init(_ dto: SearchDTO.Result) {
        let listingKind = ListingKind(rawValue: dto.listingTypeId.rawValue) ?? .goldPro
        let buyingKind = BuyingKind(rawValue: dto.buyingMode.rawValue) ?? .buyItNow
        let shipping = ShippingModel(dto.shipping)
        let seller = SellerModel(dto.seller)
        let sellerAddress = SellerAddressModel(dto.sellerAddress)
        let address = AddressModel(dto.address)

        self.init(id: dto.id,
                  title: dto.title,
                  condition: dto.condition,
                  listingKind: listingKind,
                  permalink: dto.permalink,
                  buyingKind: buyingKind,
                  siteId: dto.siteId,
                  categoryId: dto.categoryId,
                  domainId: dto.domainId,
                  thumbnail: dto.thumbnail,
                  currencyId: dto.currencyId,
                  price: dto.price,
                  originalPrice: dto.originalPrice,
                  salePrice: dto.salePrice,
                  soldQuantity: dto.soldQuantity,
                  availableQuantity: dto.availableQuantity,
                  acceptsMercadopago: dto.acceptsMercadopago,
                  tags: dto.tags,
                  shipping: shipping,
                  seller: seller,
                  sellerAddress: sellerAddress,
                  address: address)
    }
}
