import Foundation

struct Episode: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let number: Int
    let season: Int
    let summary: String
    let imageURL: URL?
}

#if DEBUG
extension Episode {
    static func fixture(
        id: Int = 1,
        name: String = "The Episode",
        number: Int = 10,
        season: Int = 20,
        summary: String,
        imageURL: URL?
    ) -> Episode {
        .init(id: id, name: name, number: number, season: season, summary: summary, imageURL: imageURL)
    }
}
#endif
