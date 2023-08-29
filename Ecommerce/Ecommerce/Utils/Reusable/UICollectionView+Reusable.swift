import UIKit

public extension UICollectionView {

    /**
     Register class faster by passing the type
     - Parameter type: Reusable.Type
     */
    func registerCell<T: Reusable>(_ type: T.Type) {
        register(type, forCellWithReuseIdentifier: type.reuseIdentifier)
    }

    /**
     DequeueCell by passing the type of Reusable and IndexPath
     - Parameter type: Reusable.Type
     - Parameter indexPath: IndexPath
     */
    func dequeueCell<T: Reusable>(_ type: T.Type, for indexPath: IndexPath) -> T {
        guard
            let cell = dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? T
        else { fatalError("Unable to dequeue Reusable cell table view cell \(String(describing: T.self))") }

        return cell
    }
}
