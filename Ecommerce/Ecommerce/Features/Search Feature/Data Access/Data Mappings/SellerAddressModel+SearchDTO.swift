import Foundation

extension SellerAddressModel {

    init(_ dto: SearchDTO.Result.SellerAddress) {
        let country = LocationCommonModel(dto.country)
        let state = LocationCommonModel(dto.state)
        let city = LocationCommonModel(dto.city)

        self.init(comment: dto.comment,
                  addressLine: dto.addressLine,
                  id: dto.id,
                  latitude: dto.latitude,
                  longitude: dto.longitude,
                  country: country,
                  state: state,
                  city: city)
    }
}
