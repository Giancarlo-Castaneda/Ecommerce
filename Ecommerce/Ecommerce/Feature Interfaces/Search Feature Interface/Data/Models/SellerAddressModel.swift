import Foundation

public struct SellerAddressModel {

    // MARK: - Public Properties

    public let comment: String
    public let addressLine: String
    public let id: Double?
    public let latitude: Double?
    public let longitude: Double?
    public let country: LocationCommonModel
    public let state: LocationCommonModel
    public let city: LocationCommonModel

    // MARK: - Initialization

    public init(comment: String,
                addressLine: String,
                id: Double?,
                latitude: Double?,
                longitude: Double?,
                country: LocationCommonModel,
                state: LocationCommonModel,
                city: LocationCommonModel) {

        self.comment = comment
        self.addressLine = addressLine
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.country = country
        self.state = state
        self.city = city
    }
}
