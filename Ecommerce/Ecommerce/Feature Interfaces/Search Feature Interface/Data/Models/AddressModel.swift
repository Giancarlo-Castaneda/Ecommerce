import Foundation

public struct AddressModel {

    // MARK: - Public Properties

    public let stateId: String
    public let stateName: String
    public let cityId: String?
    public let cityName: String

    // MARK: - Initialization

    public init(stateId: String, stateName: String, cityId: String?, cityName: String) {
        self.stateId = stateId
        self.stateName = stateName
        self.cityId = cityId
        self.cityName = cityName
    }
}
