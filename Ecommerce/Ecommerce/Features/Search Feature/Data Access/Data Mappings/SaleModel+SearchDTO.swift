import Foundation

extension SaleModel {

    init(_ dto: SearchDTO.Result.Seller.SellerReputation.Metrics.Sales) {
        self.init(period: dto.period, completed: dto.completed)
    }
}
