import Foundation

public struct TransactionsModel {

    // MARK: - Public Properties

    public let canceled: Int
    public let completed: Int
    public let period: String
    public let rating: RatingsModel
    public let total: Int

    // MARK: - Initialization

    public init(canceled: Int, completed: Int, period: String, rating: RatingsModel, total: Int) {
        self.canceled = canceled
        self.completed = completed
        self.period = period
        self.rating = rating
        self.total = total
    }
}
