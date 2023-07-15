import Ecommerce
import Foundation

final class MockNetworkingProvider: NetworkingProvider, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case sendRequest
        case genericSendRequest
    }

    // MARK: - Internal Methods

    func sendRequest(endpoint: RequestType) async throws {
        append(.sendRequest)

        if let error: Error = getStubOptionalValue(for: .sendRequest) {
            throw error
        }
    }

    func sendRequest<T>(endpoint: RequestType, responseModel: T.Type) async throws -> T where T: Decodable {
        append(.genericSendRequest)

        if let error: Error = getStubOptionalValue(for: .genericSendRequest) {
            throw error
        }

        return getStubValue(for: .genericSendRequest)
    }
}
