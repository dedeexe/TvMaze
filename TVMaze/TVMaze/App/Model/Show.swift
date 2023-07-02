import Foundation

struct Show: Identifiable, Equatable {
    var id: Int
    var name: String
    var summary: String
    var status: String
    var genres: [String]
    var rating: String
    var imageURL: URL?

    init(
        id: Int,
        name: String,
        summary: String,
        status: String,
        genres: [String],
        rating: String,
        imageURL: URL?
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.status = status
        self.rating = rating
        self.imageURL = imageURL
        self.genres = genres
    }
}

#if DEBUG
extension Show {
    static func fixture(
        id: Int = 10,
        name: String = "This is the Show",
        summary: String = "This movie is awesome",
        status: String = "Ended",
        genres: [String] = ["Sci-Fi", "Romance"],
        rating: String = "9",
        imageURL: URL? = nil
    ) -> Show {
        .init(
            id: id,
            name: name,
            summary: summary,
            status: status,
            genres: genres,
            rating: rating,
            imageURL: imageURL
        )
    }
}
#endif
