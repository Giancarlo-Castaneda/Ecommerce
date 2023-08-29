import Foundation

final class ConcreteProductSpecDataProvider: ProductSpecDataProvider {

    // MARK: - Typealias

    typealias Section = (headerTitle: String?, viewModels: [ProductSpecViewModel])

    // MARK: - Private Properties

    private lazy var sections = generateSections()
    private let productDetail: ProductDetailModel
    private let viewModelFactory: ProductSpecViewModelFactory
    private let numberFormatter: NumberFormatter

    // MARK: - Initialization

    init(productDetail: ProductDetailModel,
         viewModelFactory: ProductSpecViewModelFactory,
         numberFormatter: NumberFormatter) {

        self.productDetail = productDetail
        self.viewModelFactory = viewModelFactory
        self.numberFormatter = numberFormatter
    }

    // MARK: - Private Methods

    private func generateSections() -> [Section] {
        [
            (
                nil,
                [ConcreteProductSpecHeaderViewModel(detail: productDetail, numberFormatter: numberFormatter)]
            ),
            (
                L10n.Localizable.attributesSectionTitle,
                productDetail.attributes.map { viewModelFactory.makeProductSpecAttributeViewModel(attribute: $0) }
            )
        ]
    }

    // MARK: - Internal Methods

    func numberOfSections() -> Int {
        sections.count
    }

    func numberOfRows(inSection section: Int) -> Int {
        guard
            (0..<numberOfSections()) ~= section
        else { return 0 }

        return sections[section].viewModels.count
    }

    func titleForHeader(inSection section: Int) -> String? {
        guard
            (0..<numberOfSections()) ~= section
        else { return nil }

        return sections[section].headerTitle
    }

    func viewModel(at indexPath: IndexPath) -> ProductSpecViewModel? {
        guard
            (0..<numberOfSections()) ~= indexPath.section,
            (0..<numberOfRows(inSection: indexPath.section)) ~= indexPath.item
        else { return nil }

        return sections[indexPath.section].viewModels[indexPath.row]
    }
}
