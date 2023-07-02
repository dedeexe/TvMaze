import Foundation

struct Season {
    var episodes: [Episode]

    init(season: Int, episodes: [Episode]) {
        self.episodes = episodes.filter { $0.season == season }.sorted { $0.number < $1.number }
    }
}

struct Seasons {
    var seasons: [Season]

    init(episodes: [Episode]) {
        let mappedSeasons = Set(episodes.map { $0.season })
        let seasons = mappedSeasons.map { Season(season: $0, episodes: episodes) }
        self.seasons = seasons
    }
}
