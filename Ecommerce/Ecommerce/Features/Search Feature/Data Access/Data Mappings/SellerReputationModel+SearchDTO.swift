import Foundation

extension SellerReputationModel {

    init(_ dto: SearchDTO.Result.Seller.SellerReputation) {
        let levelKind = SellerLevelKind(rawValue: dto.levelId.rawValue) ?? .the5_Green
        let powerKind = SellerPowerKind(rawValue: dto.powerSellerStatus.rawValue) ?? .gold
        let transaction = TransactionsModel(dto.transactions)
        let metric = MetricsModel(dto.metrics)

        self.init(sellerLevelKind: levelKind, sellerPowerKind: powerKind, transaction: transaction, metric: metric)
    }
}
