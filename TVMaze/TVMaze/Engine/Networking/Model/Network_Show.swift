import Foundation

extension Model.Network {
    struct Show: Decodable, Identifiable, Hashable {
        let id: Int
        let name: String?
        let status: String?
        let genres: [String]?
        let rating: Rating?
        let summary: String?
        let image: ImageURL?
    }

    struct Rating: Decodable, Hashable {
        let average: Float?
    }

    struct ImageURL: Decodable, Hashable {
        let medium: String?
    }
}
