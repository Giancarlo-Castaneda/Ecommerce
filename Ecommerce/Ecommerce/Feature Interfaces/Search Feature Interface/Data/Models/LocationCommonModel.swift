import Foundation

public struct LocationCommonModel {

    // MARK: - Public Properties

    public let id: String?
    public let name: String

    // MARK: - Initialization

    public init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}
