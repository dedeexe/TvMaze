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
        let schedule: Schedule?
        let runtime: Int?
    }

    struct Rating: Decodable, Hashable {
        let average: Float?
    }

    struct ImageURL: Decodable, Hashable {
        let medium: String?
        let original: String?
    }

    struct Schedule: Decodable, Hashable {
        let time: String?
        let days: [String]?
    }
}
