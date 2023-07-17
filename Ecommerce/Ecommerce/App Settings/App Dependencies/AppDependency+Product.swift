import Foundation

extension AppDependency {

    struct Product {

        // MARK: - Internal Properties

        let productRepository: ProductRepository

        // MARK: - Internal Methods

        static func resolve(networkingProvider: NetworkingProvider) -> Self {
            let productRepository = ConcreteProductRepository(networkingProvider: networkingProvider)

            return Product(productRepository: productRepository)
        }
    }
}
