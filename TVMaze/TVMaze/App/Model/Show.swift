import Foundation

struct Show: Identifiable, Equatable {
    var id: Int
    var name: String
    var summary: String
    var status: String
    var genres: [String]
    var rating: String
    var scheduleDays: [String]
    var scheduleTime: String
    var duration: Int
    var imageURL: URL?
    var largeImageURL: URL?

    init(
        id: Int,
        name: String,
        summary: String,
        status: String,
        genres: [String],
        rating: String,
        scheduleDays: [String],
        scheduleTime: String,
        duration: Int,
        imageURL: URL?,
        largeImageURL: URL?
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.status = status
        self.rating = rating
        self.scheduleDays = scheduleDays
        self.scheduleTime = scheduleTime
        self.duration = duration
        self.imageURL = imageURL
        self.genres = genres
        self.largeImageURL = largeImageURL
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
        scheduleDays: [String] = ["Tue, Fri"],
        scheduleTime: String = "00:00",
        duration: Int = 60,
        imageURL: URL? = nil,
        largeImageURL: URL? = nil
    ) -> Show {
        .init(
            id: id,
            name: name,
            summary: summary,
            status: status,
            genres: genres,
            rating: rating,
            scheduleDays: scheduleDays,
            scheduleTime: scheduleTime,
            duration: duration,
            imageURL: imageURL,
            largeImageURL: largeImageURL
        )
    }
}
#endif
