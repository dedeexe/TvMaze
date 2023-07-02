import SwiftUI

struct SeasonListView: View {
    @Binding var seasons: Seasons

    var body: some View {
        LazyVStack {
            ForEach(seasons.seasons.indices, id: \.self) { idx in
                SeasonView(season: $seasons.seasons[idx])
                Divider()
            }
        }
    }
}

struct SeasonsView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonListView(
            seasons: .constant(
                Seasons(
                    episodes: (1...50).map {
                        let episode = $0 % 10 + 1
                        let season = $0 / 10 + 1
                        return .fixture(id: $0, name: "Episode S\(season)|E\(episode)", number: episode, season: season, summary: "Summary of the Episode S\(season)|E\(episode)")
                    }
                )
            )
        )
        .previewLayout(.fixed(width: 300, height: 500))
    }
}
