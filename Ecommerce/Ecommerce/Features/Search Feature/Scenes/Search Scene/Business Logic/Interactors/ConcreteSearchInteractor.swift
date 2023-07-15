import Foundation

final class ConcreteSearchInteractor: SearchInteractor {

    // MARK: - Private Properties

    private let searchWorker: SearchFetchWorker
    private let itemsPerPage = 20
    private let siteId = "MLA"
    private var showedItems: [SearchItemModel] = []
    private var offset = 0
    private var totalItems = 0
    private var previousQuery = ""
    private var isWaitingForResponse = false

    // MARK: - Internal Properties

    var presenter: SearchInteractorOutput?

    // MARK: - Initialization

    init(searchWorker: SearchFetchWorker) {
        self.searchWorker = searchWorker
    }

    // MARK: - Private Methods

    private func shouldContinueSearching(offset: Int, totalItems: Int) -> Bool {
        (offset == 0 && totalItems == 0) || offset < totalItems
    }

    private func isNewSearch(previousQuery: String, query: String) -> Bool {
        previousQuery != query
    }

    // MARK: - Internal Methods

    func search(query: String) {
        Task {
            do {
                guard
                    !isWaitingForResponse
                else { return }

                if isNewSearch(previousQuery: previousQuery, query: query) {
                    offset = 0
                    totalItems = 0
                    showedItems.removeAll()
                }
                previousQuery = query

                guard
                    shouldContinueSearching(offset: offset, totalItems: totalItems)
                else {
                    isWaitingForResponse = false
                    return
                }

                isWaitingForResponse = true

                await presenter?.loading()

                let search = try await searchWorker.execute(query: query,
                                                            siteId: siteId,
                                                            offset: offset,
                                                            limit: itemsPerPage)

                showedItems.append(contentsOf: search.items)
                totalItems = search.paging.totalResults
                offset = showedItems.count

                await presenter?.searched(items: showedItems)
                isWaitingForResponse = false
            } catch {
                await presenter?.error(error)
            }
        }
    }
}
