import Foundation

protocol ProductDetailViewModel {

    var title: String { get }
    var permalink: URL { get }
    var sellerId: Int { get }
    var condition: String { get }
    var price: String { get }
    var availableQuantity: String { get }
    var pictures: [PictureModel] { get }
}
