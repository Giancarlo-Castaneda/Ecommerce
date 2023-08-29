import Foundation

final class ConcreteProductDetailPresenter: ProductDetailInteractorOutput {

    // MARK: - Internal Properties

    weak var view: ProductDetailPresenterOutput?

    // MARK: - Internal Methods

    func loading() async {
        await view?.configure(state: .loading)
    }

    func fetchedDetail(detail: ProductDetailModel) async {
        await view?.configure(title: detail.title)
        await view?.configure(state: .content(detail: detail))
    }

    func error(_ error: Error) async {
        await view?.configure(state: .failure(title: "Error", message: error.localizedDescription))
    }
}
