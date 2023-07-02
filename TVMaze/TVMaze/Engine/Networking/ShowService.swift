import DDXNetwork
import Foundation

class ShowService {
    let service: RequestService

    init(service: RequestService = RequestWorker()) {
        self.service = service
    }

    func getAll(page: Int = 0) async throws -> [Show] {
        let request = Request(
            url: AppConfig.baseURL + "shows?page=\(page)",
            method: .get,
            headers: [:]
        )
        
        return try await withCheckedThrowingContinuation{ (continuation: CheckedContinuation<[Show], Error>) in
            service.request([Model.Network.Show].self, from: request, additionalHeaders: [:]) { result in
                switch result {
                case .success(let value):
                    let shows = value.map { Show(from: $0) }
                    continuation.resume(returning: shows)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

private extension Show {
    init(from model: Model.Network.Show) {
        id = model.id
        name = model.name ?? ""
        summary = model.summary ?? ""
        status = model.status ?? ""
        rating = String(model.rating?.average ?? 0.0)
        imageURL = URL(string: model.image?.medium ?? "")
        largeImageURL = URL(string: model.image?.original ?? "")
        genres = model.genres ?? []
    }
}
