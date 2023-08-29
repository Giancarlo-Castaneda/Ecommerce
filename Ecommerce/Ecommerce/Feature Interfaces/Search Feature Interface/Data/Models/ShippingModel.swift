import Foundation

public struct ShippingModel {

    // MARK: - Public Properties

    public let storePickUp: Bool
    public let freeShipping: Bool
    public let logisticType: String
    public let mode: String
    public let tags: [String]

    // MARK: - Initialization

    public init(storePickUp: Bool, freeShipping: Bool, logisticType: String, mode: String, tags: [String]) {
        self.storePickUp = storePickUp
        self.freeShipping = freeShipping
        self.logisticType = logisticType
        self.mode = mode
        self.tags = tags
    }
}
