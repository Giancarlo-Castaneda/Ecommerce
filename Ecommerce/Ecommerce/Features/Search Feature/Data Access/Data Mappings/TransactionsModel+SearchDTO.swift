import Foundation

extension TransactionsModel {

    init(_ dto: SearchDTO.Result.Seller.SellerReputation.Transactions) {
        let rating = RatingsModel(dto.ratings)

        self.init(canceled: dto.canceled,
                  completed: dto.completed,
                  period: dto.period,
                  rating: rating,
                  total: dto.total)
    }
}
