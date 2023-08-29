import Foundation

public struct RatingsModel {

    // MARK: - Public Properties

    public let negative: Double
    public let neutral: Double
    public let positive: Double

    // MARK: - Initialization

    public init(negative: Double, neutral: Double, positive: Double) {
        self.negative = negative
        self.neutral = neutral
        self.positive = positive
    }
}
