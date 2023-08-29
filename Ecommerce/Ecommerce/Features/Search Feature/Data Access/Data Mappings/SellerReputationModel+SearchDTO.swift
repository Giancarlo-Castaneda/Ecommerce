import Foundation

extension SellerReputationModel {

    init(_ dto: SearchDTO.Result.Seller.SellerReputation) {
        let levelKind = SellerLevelKind(rawValue: dto.levelId?.rawValue ?? "") ?? .none
        let powerKind = SellerPowerKind(rawValue: dto.powerSellerStatus?.rawValue ?? "") ?? .none
        let transaction = TransactionsModel(dto.transactions)
        let metric = MetricsModel(dto.metrics)

        self.init(sellerLevelKind: levelKind, sellerPowerKind: powerKind, transaction: transaction, metric: metric)
    }
}
