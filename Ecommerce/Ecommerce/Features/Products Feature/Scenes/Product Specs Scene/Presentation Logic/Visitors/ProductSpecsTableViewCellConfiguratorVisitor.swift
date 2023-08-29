import UIKit

final class ProductSpecsTableViewCellConfiguratorVisitor: ProductSpecsViewModelVisitor {

    // MARK: - Private Properties

    private let tableView: UITableView
    private let indexPath: IndexPath

    // MARK: - Initialization

    init(tableView: UITableView, indexPath: IndexPath) {
        self.tableView = tableView
        self.indexPath = indexPath
    }

    // MARK: - Internal Methods

    func visit(_ viewModel: ProductSpecHeaderViewModel) -> UITableViewCell {
        let cell = tableView.dequeueCell(ProductSpecsHeaderCell.self, for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        cell.configure(viewModel: viewModel)

        return cell
    }

    func visit(_ viewModel: ProductSpecAttributeViewModel) -> UITableViewCell {
        let cell = tableView.dequeueCell(UITableViewCell.self, for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()

        contentConfiguration.prefersSideBySideTextAndSecondaryText = true
        contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: .body, weight: .bold)
        contentConfiguration.textProperties.color = .black
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .body)
        contentConfiguration.secondaryTextProperties.color = .darkGray

        contentConfiguration.text = viewModel.name
        contentConfiguration.secondaryText = viewModel.value

        cell.selectionStyle = .none
        cell.backgroundColor = .white
        cell.contentConfiguration = contentConfiguration

        return cell
    }
}
