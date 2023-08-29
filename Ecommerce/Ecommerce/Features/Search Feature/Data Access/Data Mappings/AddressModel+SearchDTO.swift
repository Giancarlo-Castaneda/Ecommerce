import Foundation

extension AddressModel {

    init(_ dto: SearchDTO.Result.Address) {
        self.init(stateId: dto.stateId, stateName: dto.stateName, cityId: dto.cityId, cityName: dto.cityName)
    }
}
