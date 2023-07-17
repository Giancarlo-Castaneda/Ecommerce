import UIKit

public enum AssetsColor: String {
    case screenBackground = "ScreenBackground"
    case greenAccent = "GreenAccent"
    case purple = "Purple"
}

// MARK: - App Color

public extension AssetsColor {

    var appColor: UIColor {
        UIColor(named: self.rawValue) ?? .white
    }
}
