import Foundation

public struct MetricsModel {

    // MARK: - Public Properties

    public let sale: SaleModel
    public let claim: MetricDetailModel
    public let delayedHandlingTime: MetricDetailModel
    public let cancellation: MetricDetailModel

    // MARK: - Initialization

    public init(sale: SaleModel,
                claim: MetricDetailModel,
                delayedHandlingTime: MetricDetailModel,
                cancellation: MetricDetailModel) {

        self.sale = sale
        self.claim = claim
        self.delayedHandlingTime = delayedHandlingTime
        self.cancellation = cancellation
    }
}
