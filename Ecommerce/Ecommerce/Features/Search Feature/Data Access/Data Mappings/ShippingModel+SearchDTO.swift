import Foundation

extension ShippingModel {

    init(_ dto: SearchDTO.Result.Shipping) {
        self.init(storePickUp: dto.storePickUp,
                  freeShipping: dto.storePickUp,
                  logisticType: dto.logisticType,
                  mode: dto.mode,
                  tags: dto.tags)
    }
}
