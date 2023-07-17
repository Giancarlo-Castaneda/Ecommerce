import UIKit

final class EmptyView: UIView {

    private lazy var stackView = UIStackView().with {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 10
    }

    private lazy var imageView = UIImageView().with {
        $0.image = UIImage(systemName: "rectangle.and.text.magnifyingglass")
        $0.tintColor = AssetsColor.purple.appColor
    }

    private lazy var titleLabel = UILabel().with {
        $0.textColor = .darkGray
        $0.font = UIFont.preferredFont(forTextStyle: .title1)
        $0.textAlignment = .center
        $0.numberOfLines = 3
    }

    private lazy var bodyLabel = UILabel().with {
        $0.textColor = .darkGray
        $0.font = UIFont.preferredFont(forTextStyle: .body)
        $0.textAlignment = .center
        $0.numberOfLines = 3
    }

    private var height = 0.0

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        height = bounds.height
    }

    // MARK: - Private Methods

    private func setupUI() {
        backgroundColor = AssetsColor.screenBackground.appColor

        addSubview(stackView)

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(bodyLabel)

        stackView.setCustomSpacing(30, after: imageView)
    }

    private func setupConstraints() {
        stackView.layout.centerYAnchor(to: self, offset: -10)
        stackView.layout.fillSuperviewHorizontally(offset: 20)
        stackView.layout.topAnchor(to: self, offset: 20, relation: .greaterThanOrEqual)
        stackView.layout.bottomAnchor(to: self, offset: 20, relation: .lessThanOrEqual)
        imageView.layout.heightAnchor(80)
        imageView.layout.aspectRatio(1, dimension: .height)
    }

    // MARK: - Internal Methods

    func configureView(title: String, body: String?) {
        titleLabel.text = title
        bodyLabel.text = body
        bodyLabel.isHidden = body == nil
    }
}
