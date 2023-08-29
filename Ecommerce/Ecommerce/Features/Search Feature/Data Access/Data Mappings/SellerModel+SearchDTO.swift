import Foundation

extension SellerModel {

    init(_ dto: SearchDTO.Result.Seller) {
        let sellerReputation = SellerReputationModel(dto.sellerReputation)

        self.init(id: dto.id,
                  nickname: dto.nickname,
                  carDealer: dto.carDealer,
                  realEstateAgency: dto.realEstateAgency,
                  registrationDate: dto.registrationDate,
                  tags: dto.tags,
                  permalink: dto.permalink,
                  sellerReputation: sellerReputation)
    }
}
