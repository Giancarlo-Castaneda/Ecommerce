import Foundation

extension ProductDetailModel {

    init(_ dto: ProductDTO.Body) {
        let listingKind = ListingKind(rawValue: dto.listingTypeId.rawValue) ?? .none
        let shipping = ShippingModel(dto.shipping)
        let pictures = dto.pictures.map { PictureModel($0) }
        let attributes = dto.attributes.map { AttributeModel($0) }

        self.init(sellerId: dto.sellerId,
                  siteId: dto.siteId,
                  title: dto.title,
                  condition: dto.condition,
                  listingKind: listingKind,
                  permalink: dto.permalink,
                  categoryId: dto.categoryId,
                  currencyId: dto.currencyId,
                  price: dto.price,
                  originalPrice: dto.originalPrice,
                  salePrice: dto.salePrice,
                  soldQuantity: dto.soldQuantity,
                  availableQuantity: dto.availableQuantity,
                  acceptsMercadopago: dto.acceptsMercadopago,
                  tags: dto.tags,
                  shipping: shipping,
                  dateCreated: dto.dateCreated,
                  lastUpdated: dto.lastUpdated,
                  warranty: dto.warranty,
                  pictures: pictures,
                  attributes: attributes)
    }
}
