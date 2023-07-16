import Ecommerce
import Foundation

struct MockSearchItemViewModel: SearchItemViewModel {

    var id = SearchItemID("")
    var title = ""
    var imageURL = URL(string: "foo.com")!
    var price = ""
    var originalPrice: String? = nil
    var discount: String? = nil
    var freeShipping = true
}
