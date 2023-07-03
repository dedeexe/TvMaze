import DDXNetwork
import Foundation

class SeasonsService {
    let service: RequestService

    init(service: RequestService = RequestWorker()) {
        self.service = service
    }

    func getAll(showId: Int) async throws -> Seasons {
        let request = Request(
            url: Config.baseURL + "shows/\(showId)/episodes",

            method: .get,
            headers: [:]
        )

        return try await withCheckedThrowingContinuation{ (continuation: CheckedContinuation<Seasons, Error>) in
            service.request([Model.Network.Episode].self, from: request, additionalHeaders: [:]) { result in
                switch result {
                case .success(let value):
                    let episodes = value.map { Episode(from: $0) }
                    let seasons = Seasons(episodes: episodes)
                    continuation.resume(returning: seasons)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

private extension Episode {
    init(from model: Model.Network.Episode) {
        id = model.id
        name = model.name ?? ""
        number = model.number ?? 0
        season = model.season ?? 0
        summary = model.summary ?? ""
        imageURL = URL(string: model.image?.original ?? "")
        runtime = model.runtime ?? 0
        date = model.airdate ?? "-"
    }
}
