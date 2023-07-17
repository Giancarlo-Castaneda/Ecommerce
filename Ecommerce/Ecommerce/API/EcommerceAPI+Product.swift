import Foundation

extension EcommerceAPI {

    static func itemsGET(id: SearchItemID) -> EcommerceAPI {
        let query = [
            URLQueryItem(name: "ids", value: id.wrappedValue)
        ]

        return .init(path: "/items", method: .get, body: nil, queryItems: query)
    }
}
