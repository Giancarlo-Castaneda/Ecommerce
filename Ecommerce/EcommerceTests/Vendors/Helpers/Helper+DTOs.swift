import Ecommerce
import Foundation
import XCTest

extension Helper {

    static func makeSearchGETDTOData() throws -> Data {
        let bundle = try XCTUnwrap(Bundle(identifier: "co.gian.Ecommerce"))

        return try XCTUnwrap(NSDataAsset(name: "Search_GET.json", bundle: bundle)).data
    }

    static func makeSearchGETDTO() throws -> SearchDTO {
        let jsonDecoder = makeJSONDecoder()

        return try jsonDecoder.decode(SearchDTO.self, from: makeSearchGETDTOData())
    }
}
