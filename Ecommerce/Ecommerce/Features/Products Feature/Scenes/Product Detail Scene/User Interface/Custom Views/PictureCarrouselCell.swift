import Nuke
import NukeExtensions
import UIKit

final class PictureCarrouselCell: UITableViewCell {

    // MARK: - View Components

    private lazy var pictureImageView = UIImageView().with {
        $0.contentMode = .scaleAspectFit
    }

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(pictureImageView)
    }

    private func setupConstraints() {
        pictureImageView.layout.fillSuperview()
    }

    private func loadImage(url: URL, imageView: UIImageView) {
        let request = ImageRequest(url: url)

        var options = ImageLoadingOptions()
        options.contentModes = .init(success: .scaleAspectFit,
                                     failure: .scaleAspectFit,
                                     placeholder: .scaleAspectFit)

        NukeExtensions.loadImage(with: request, options: options, into: imageView)
    }

    // MARK: - Internal Methods

    func configureView(url: URL) {
        loadImage(url: url, imageView: pictureImageView)
    }
}
