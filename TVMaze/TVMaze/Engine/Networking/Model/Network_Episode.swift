import Foundation

extension Model.Network {
    struct Episode: Decodable, Identifiable, Hashable {
        let id: Int
        let name: String?
        let number: Int?
        let season: Int?
        let summary: String?
        let image: ImageURL?
    }
}
