import Foundation

public struct SellerModel {

    // MARK: - Public Properties

    public let id: Int
    public let nickname: String
    public let carDealer: Bool
    public let realEstateAgency: Bool
    public let registrationDate: Date
    public let tags: [String]
    public let permalink: URL
    public let sellerReputation: SellerReputationModel

    // MARK: - Initialization

    public init(id: Int,
                nickname: String,
                carDealer: Bool,
                realEstateAgency: Bool,
                registrationDate: Date,
                tags: [String],
                permalink: URL,
                sellerReputation: SellerReputationModel) {

        self.id = id
        self.nickname = nickname
        self.carDealer = carDealer
        self.realEstateAgency = realEstateAgency
        self.registrationDate = registrationDate
        self.tags = tags
        self.permalink = permalink
        self.sellerReputation = sellerReputation
    }
}
