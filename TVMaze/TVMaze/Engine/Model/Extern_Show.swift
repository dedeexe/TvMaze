import Foundation

extension Model.Extern {
    struct Show: Decodable, Identifiable, Hashable {
        let id: Int
        let name: String?
        let status: String?

        let rating: Rating?
    }

    struct Rating: Decodable, Hashable {
        let average: Float?
    }

    
}
