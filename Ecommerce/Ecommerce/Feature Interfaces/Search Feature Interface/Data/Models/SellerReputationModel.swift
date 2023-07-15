import Foundation

public struct SellerReputationModel {

    // MARK: - Public Properties

    public let sellerLevelKind: SellerLevelKind
    public let sellerPowerKind: SellerPowerKind
    public let transaction: TransactionsModel
    public let metric: MetricsModel

    // MARK: - Initialization

    public init(sellerLevelKind: SellerLevelKind,
                sellerPowerKind: SellerPowerKind,
                transaction: TransactionsModel,
                metric: MetricsModel) {

        self.sellerLevelKind = sellerLevelKind
        self.sellerPowerKind = sellerPowerKind
        self.transaction = transaction
        self.metric = metric
    }
}
