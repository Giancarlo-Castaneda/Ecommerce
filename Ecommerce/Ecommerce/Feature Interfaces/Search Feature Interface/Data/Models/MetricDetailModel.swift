import Foundation

public struct MetricDetailModel {

    // MARK: - Public Properties

    public let period: String
    public let rate: Double
    public let value: Int

    // MARK: - Initialization

    public init(period: String, rate: Double, value: Int) {
        self.period = period
        self.rate = rate
        self.value = value
    }
}
