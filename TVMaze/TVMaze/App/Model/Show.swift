import Foundation

struct Show: Identifiable {
    var id: Int
    var name: String
    var status: String
    var rating: String

    init(
        id: Int,
        name: String,
        status: String,
        rating: String
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.rating = rating
    }
}

#if DEBUG
extension Show {
    static func fixture(
        id: Int = 10,
        name: String = "This is the Show",
        status: String = "Ended",
        rating: String = "9"
    ) -> Show {
        .init(id: id, name: name, status: status, rating: rating)
    }
}
#endif
