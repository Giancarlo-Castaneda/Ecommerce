import Foundation

public struct AttributeModel {

    // MARK: - Public Properties

    public let id: String
    public let name: String
    public let valueId: String?
    public let valueName: String?

    // MARK: - Initialization

    public init(id: String, name: String, valueId: String?, valueName: String?) {
        self.id = id
        self.name = name
        self.valueId = valueId
        self.valueName = valueName
    }
}
