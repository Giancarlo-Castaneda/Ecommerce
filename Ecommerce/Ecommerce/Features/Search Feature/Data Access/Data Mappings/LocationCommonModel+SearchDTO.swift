import Foundation

extension LocationCommonModel {

    init(_ dto: SearchDTO.Result.SellerAddress.Sort) {
        self.init(id: dto.id, name: dto.name)
    }
}
