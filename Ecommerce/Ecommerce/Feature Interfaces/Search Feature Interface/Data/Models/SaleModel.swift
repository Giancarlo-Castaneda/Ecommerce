import Foundation

public struct SaleModel {

    // MARK: - Public Properties

    public let period: String
    public let completed: Int

    // MARK: - Initialization

    public init(period: String, completed: Int) {
        self.period = period
        self.completed = completed
    }
}
