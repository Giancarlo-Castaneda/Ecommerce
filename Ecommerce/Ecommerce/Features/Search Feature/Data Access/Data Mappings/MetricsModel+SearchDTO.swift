import Foundation

extension MetricsModel {

    init(_ dto: SearchDTO.Result.Seller.SellerReputation.Metrics) {
        let sale = SaleModel(dto.sales)
        let claim = MetricDetailModel(dto.claims)
        let delayedTime = MetricDetailModel(dto.delayedHandlingTime)
        let cancellation = MetricDetailModel(dto.cancellations)

        self.init(sale: sale, claim: claim, delayedHandlingTime: delayedTime, cancellation: cancellation)
    }
}
