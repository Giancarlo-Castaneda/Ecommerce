import UIKit

final class ProductDetailContentView: UIView {

    // MARK: - View Components

    private lazy var picturesTableView = UITableView().with {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
        $0.registerCell(PictureCarrouselCell.self)
        $0.isPagingEnabled = true
    }

    private lazy var pageControl = UIPageControl().with {
        $0.isUserInteractionEnabled = false
        $0.pageIndicatorTintColor = .black
        $0.currentPageIndicatorTintColor = AssetsColor.greenAccent.appColor
        $0.direction = .topToBottom
    }

    // MARK: - Private Properties

    private var pictures: [PictureModel] = []

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)

        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(picturesTableView)
        addSubview(pageControl)
    }

    private func setupConstraints() {
        picturesTableView.layout.topAnchor(to: self)
        picturesTableView.layout.heightAnchor(to: self, multiplier: 0.7)
        picturesTableView.layout.fillSuperviewHorizontally()
        pageControl.layout.centerYAnchor(to: picturesTableView)
        pageControl.layout.trailingAnchor(to: picturesTableView)
    }

    func configureView(pictures: [PictureModel]) {
        self.pictures = pictures
        pageControl.numberOfPages = pictures.count
        picturesTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ProductDetailContentView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(PictureCarrouselCell.self, for: indexPath)
        let image = pictures[indexPath.row]

        cell.configureView(url: image.secureUrl)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProductDetailContentView: UITableViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.y / scrollView.frame.size.height)
        pageControl.currentPage = Int(pageNumber)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.bounds.height
    }
}
