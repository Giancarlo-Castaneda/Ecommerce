import UIKit

final class ProductSpecsHeaderCell: UITableViewCell {

    // MARK: - View Components

    private lazy var stackView = UIStackView().with {
        $0.axis = .vertical
        $0.spacing = 5
    }

    private lazy var titleLabel = UILabel().with {
        $0.textColor = .black
        $0.font = UIFont.preferredFont(forTextStyle: .title2)
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }

    private lazy var priceLabel = UILabel().with {
        $0.textColor = AssetsColor.purple.appColor
        $0.font = UIFont.preferredFont(forTextStyle: .headline)
    }

    private lazy var originalPriceLabel = UILabel().with {
        $0.textColor = .lightGray
        $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(originalPriceLabel)
    }

    private func setupConstraints() {
        stackView.layout.fillSuperview(offset: 10)
        stackView.setCustomSpacing(10, after: titleLabel)
    }

    // MARK: - Internal Methods

    func configure(viewModel: ProductSpecHeaderViewModel) {
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        if let originalPrice = viewModel.originalPrice {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: originalPrice)
            attributeString.addAttribute(.strikethroughStyle,
                                         value: 2,
                                         range: NSRange(location: 0, length: attributeString.length))
            originalPriceLabel.attributedText = attributeString
        }
    }
}
