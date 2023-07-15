import Foundation

extension RatingsModel {

    init(_ dto: SearchDTO.Result.Seller.SellerReputation.Transactions.Ratings) {
        self.init(negative: dto.negative, neutral: dto.neutral, positive: dto.positive)
    }
}
