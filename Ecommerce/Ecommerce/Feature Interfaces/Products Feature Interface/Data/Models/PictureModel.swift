import Foundation

public struct PictureModel {

    // MARK: - Public Properties

    public let id: String
    public let url: URL
    public let secureUrl: URL
    public let size: String
    public let maxSize: String

    // MARK: - Initialization

    public init(id: String, url: URL, secureUrl: URL, size: String, maxSize: String) {
        self.id = id
        self.url = url
        self.secureUrl = secureUrl
        self.size = size
        self.maxSize = maxSize
    }
}
