import Foundation

extension AppDependency {

    struct Search {

        // MARK: - Internal Properties

        let searchRepository: SearchRepository

        // MARK: - Internal Methods

        static func resolve(networkingProvider: NetworkingProvider) -> Self {
            let searchRepository = ConcreteSearchRepository(networkingProvider: networkingProvider)

            return Search(searchRepository: searchRepository)
        }
    }
}
