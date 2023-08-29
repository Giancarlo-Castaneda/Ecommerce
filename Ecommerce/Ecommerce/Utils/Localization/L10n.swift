import Foundation

public enum L10n {
    enum Localizable {
        static let searchBarPlaceholder = L10n.tr("Localizable", "SEARCH_BAR_PLACEHOLDER", fallback: "Search a product...")
        static let searchEmptyTitle = L10n.tr("Localizable", "SEARCH_EMPTY_TITLE", fallback: "Find your product and look for the best offer")
        static let searchEmptyBody = L10n.tr("Localizable", "SEARCH_EMPTY_BODY", fallback: "Start looking for all the products you want.")
        static let searchItemFreeTag = L10n.tr("Localizable", "SEARCH_ITEM_FREE_TAG", fallback: "• Free Delivery")
        static let ok = L10n.tr("Localizable", "OK", fallback: "Ok")
        static let cancel = L10n.tr("Localizable", "CANCEL", fallback: "Cancel")
        static let error = L10n.tr("Localizable", "ERROR", fallback: "Error")
        static let priceNotFoundMessage = L10n.tr("Localizable", "PRICE_NOT_FOUND_MESSAGE", fallback: "Price not available")
        static func discountText(number: Int) -> String {
            L10n.tr("Localizable", "DISCOUNT_TEXT", number, fallback: "Price not available")
        }
        static let attributesSectionTitle = L10n.tr("Localizable", "ATTRIBUTES_SECTION_TITLE", fallback: "About the product")
    }
}

// MARK: - Implementation Details

extension L10n {

    private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)

        return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: BundleToken.self)
        #endif
    }()
}
