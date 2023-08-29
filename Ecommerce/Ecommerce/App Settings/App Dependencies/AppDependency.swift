import Foundation

struct AppDependency {

    // MARK: - Internal Properties

    let networkingProvider: NetworkingProvider
    let currencyFormatter: NumberFormatter
    let locale: Locale
    let routeService: RouteService
    let search: Search
}

// MARK: - Resolve

extension AppDependency {

    static func resolve() -> Self {

        // MARK: JSONDecoder

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)

        // MARK: Locale

        let locale = Locale.current

        // MARK: NumberFormatter

        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = locale
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 2

        // MARK: NetworkingProvider

        let networkingProvider = ConcreteNetworkingProvider(jsonDecoder: jsonDecoder)

        // MARK: RouteService

        let routeService = ConcreteRouteService()

        // MARK: Search

        let search = Search.resolve(networkingProvider: networkingProvider)

        return AppDependency(networkingProvider: networkingProvider,
                             currencyFormatter: currencyFormatter,
                             locale: locale,
                             routeService: routeService,
                             search: search)
    }
}
