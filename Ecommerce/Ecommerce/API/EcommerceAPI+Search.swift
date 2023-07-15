import Foundation

extension EcommerceAPI {

    static func searchByQueryGET(query: String, siteId: String, offset: Int, limit: Int) -> EcommerceAPI {
        let query = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ]

        return .init(path: "/sites/\(siteId)/search", method: .get, body: nil, queryItems: query)
    }
}
