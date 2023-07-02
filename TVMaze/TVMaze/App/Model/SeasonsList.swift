import Foundation

@MainActor
final class SeasonsList: ObservableObject {
    @Published var seasons: Seasons = Seasons(episodes: [])
    @Published private(set) var isLoading: Bool = false

    let service: SeasonsService

    init(serviceLocator: ServiceLocator = ServiceLocatorFactory.default) {
        guard let service: SeasonsService = serviceLocator.resolve() else {
            fatalError("Show Service now found")
        }

        self.service = service
    }

    func loadEpisodes(showId: Int) {
        Task {
            do {
                isLoading = true
                let seasons = try await service.getAll(showId: showId)
                self.seasons = seasons
                isLoading = false
            } catch {
                isLoading = false
            }
        }
    }
}

#if DEBUG
extension SeasonsList {
    static var mocked: SeasonsList {
        SeasonsList()
    }
}
#endif

