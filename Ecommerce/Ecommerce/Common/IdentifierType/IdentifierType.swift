import Foundation

public struct IdentifierType<T, KeyType: Decodable & Hashable> {

    // MARK: - Public Properties

    public let wrappedValue: KeyType

    // MARK: - Initialization

    public init(_ wrappedValue: KeyType) {
        self.wrappedValue = wrappedValue
    }
}

// MARK: - Decodable

extension IdentifierType: Decodable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        self.wrappedValue = try container.decode(KeyType.self)
    }
}

// MARK: - Hashable

extension IdentifierType: Hashable { }
