import Foundation

@MainActor
final class ShowsList: ObservableObject {
    @Published var list: [Show] = []
    @Published private(set) var isFirstLoading: Bool = true
    @Published private(set) var isLoading: Bool = false
    private(set) var page = 0
    private(set) var hasMorePages: Bool = true

    let service: ShowService

    init(serviceLocator: ServiceLocator = ServiceLocatorFactory.default) {
        guard let service: ShowService = serviceLocator.resolve() else {
            fatalError("Show Service now found")
        }

        self.service = service
    }

    func load() {
        Task {
            do {
                isLoading = true
                let shows = try await service.getAll(page: page)
                
                if !shows.isEmpty {
                    page += 1
                }
                
                list += shows
                isLoading = false
                isFirstLoading = false
            } catch {
                isLoading = false
            }
        }
    }
}

#if DEBUG
extension ShowsList {
    static var mocked: ShowsList {
        ShowsList()
    }
}
#endif
