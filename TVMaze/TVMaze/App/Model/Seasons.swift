import Foundation

struct Season {
    var episodes: [Episode]
    var episodesCount: Int { episodes.count }
    var expanded: Bool = false
    var number: Int

    init(season: Int, episodes: [Episode], expanded: Bool = false) {
        self.number = season
        self.episodes = episodes.filter { $0.season == season }.sorted { $0.number < $1.number }
    }
}

struct Seasons {
    var seasons: [Season]

    init(episodes: [Episode]) {
        let mappedSeasons = Set(episodes.map { $0.season })
        let seasons = mappedSeasons.map { Season(season: $0, episodes: episodes) }.sorted { $0.number < $1.number }
        self.seasons = seasons
    }
}
