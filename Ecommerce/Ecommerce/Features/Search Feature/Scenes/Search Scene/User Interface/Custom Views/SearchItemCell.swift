import Nuke
import NukeExtensions
import UIKit

final class SearchItemCell: UICollectionViewCell {

    // MARK: - View Components

    private lazy var stackView = UIStackView().with {
        $0.axis = .vertical
        $0.spacing = 3
    }

    private lazy var imageView = UIImageView().with {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = LayoutConstant.cornerRadius
    }

    private lazy var titleLabel = UILabel().with {
        $0.textColor = .darkGray
        $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }

    private lazy var priceLabel = UILabel().with {
        $0.textColor = .black
        $0.font = UIFont.preferredFont(forTextStyle: .headline)
    }

    private lazy var originalPriceLabel = UILabel().with {
        $0.textColor = .lightGray
        $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }

    private lazy var discountView = UIImageView().with {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = AssetsColor.greenAccent.appColor
        $0.image = UIImage(systemName: "seal.fill")
    }

    private lazy var discountLabel = UILabel().with {
        $0.textColor = .white
        $0.font = UIFont.preferredFont(forTextStyle: .caption1)
        $0.textAlignment = .center
    }

    private lazy var freeShippingLabel = PaddingLabel().with {
        $0.textColor = AssetsColor.greenAccent.appColor
        $0.backgroundColor = .white.withAlphaComponent(0.8)
        $0.font = UIFont.preferredFont(forTextStyle: .caption1)
        $0.textAlignment = .center
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
        $0.edgeInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Improve scrolling performance with an explicit shadowPath
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: LayoutConstant.cornerRadius
        ).cgPath
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(stackView)
        addSubview(discountView)
        discountView.addSubview(discountLabel)
        addSubview(freeShippingLabel)

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(originalPriceLabel)

        backgroundColor = .white

        layer.cornerRadius = LayoutConstant.cornerRadius
        layer.masksToBounds = false

        layer.shadowRadius = 8.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.10
        layer.shadowOffset = LayoutConstant.shadowOffset
    }

    private func setupConstraints() {
        stackView.layout.fillSuperview(offset: LayoutConstant.spacing)
        imageView.layout.heightAnchor(bounds.height * LayoutConstant.imageProportionalHeight)
        discountView.layout.heightAnchor(LayoutConstant.discountHeight)
        discountView.layout.widthAnchor(LayoutConstant.discountHeight)
        discountView.layout.trailingAnchor(to: imageView, offset: -LayoutConstant.spacing)
        discountView.layout.bottomAnchor(to: imageView, offset: -LayoutConstant.spacing)
        discountLabel.layout.centerSuperview()
        freeShippingLabel.layout.topAnchor(to: imageView, offset: LayoutConstant.spacing)
        freeShippingLabel.layout.leadingAnchor(to: imageView, offset: LayoutConstant.spacing)
    }

    private func loadImage(url: URL, imageView: UIImageView) {
        let request = ImageRequest(url: url)

        var options = ImageLoadingOptions(transition: .fadeIn(duration: 0.3))
        options.contentModes = .init(success: .scaleAspectFill,
                                     failure: .scaleAspectFill,
                                     placeholder: .scaleAspectFit)

        NukeExtensions.loadImage(with: request, options: options, into: imageView)
    }

    // MARK: - Internal Methods

    func configure(item: SearchItemViewModel) {
        titleLabel.text = item.title
        priceLabel.text = item.price
        discountLabel.text = item.discount
        discountView.isHidden = item.discount == nil
        freeShippingLabel.text = "• Free Delivery"
        freeShippingLabel.isHidden = !item.freeShipping
        originalPriceLabel.isHidden = item.originalPrice == nil
        loadImage(url: item.imageURL, imageView: imageView)

        if let originalPrice = item.originalPrice {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: originalPrice)
            attributeString.addAttribute(.strikethroughStyle,
                                         value: 2,
                                         range: NSRange(location: 0, length: attributeString.length))
            originalPriceLabel.attributedText = attributeString
        }
    }
}
