import Foundation

public protocol SearchItemViewModel {

    var id: SearchItemID { get }
    var title: String { get }
    var imageURL: URL { get }
    var price: String { get }
    var originalPrice: String? { get }
    var discount: String? { get }
    var freeShipping: Bool { get }
}
