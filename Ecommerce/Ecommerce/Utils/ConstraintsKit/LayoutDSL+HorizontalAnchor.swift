import UIKit

public extension LayoutDSL {

    enum HorizontalAnchor {
        case leading
        case trailing
        case safeLeading
        case safeTrailing
    }
}

// MARK: - getAnchor

extension LayoutDSL.HorizontalAnchor {

    func getAnchor(view: UIView) -> NSLayoutXAxisAnchor {
        switch self {

        case .leading:
            return view.leadingAnchor

        case .trailing:
            return view.trailingAnchor

        case .safeLeading:
            return view.safeAreaLayoutGuide.leadingAnchor

        case .safeTrailing:
            return view.safeAreaLayoutGuide.trailingAnchor

        }
    }
}
