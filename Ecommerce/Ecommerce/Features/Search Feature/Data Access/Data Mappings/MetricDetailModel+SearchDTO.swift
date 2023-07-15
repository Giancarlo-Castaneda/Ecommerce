import Foundation

extension MetricDetailModel {

    init(_ dto: SearchDTO.Result.Seller.SellerReputation.Metrics.MetricDetail) {
        self.init(period: dto.period, rate: dto.rate, value: dto.value)
    }
}
