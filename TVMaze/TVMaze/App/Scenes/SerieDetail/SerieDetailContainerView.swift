import SwiftUI

struct SerieDetailContainerView: View {
    @State var show: Show
    @State var selectedEpisode: Episode?
    @ObservedObject var showsData: ShowsData
    @StateObject var seasonsList = SeasonsData()

    var body: some View {
        SerieDetailView(show: $show, selectedEpisode: $selectedEpisode)
            .navigationTitle(show.name)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { seasonsList.loadEpisodes(showId: show.id) }
            .sheet(item: $selectedEpisode) { episode in
                EpisodeDetailView(episode: episode, show: show)
            }
            .environmentObject(showsData)
            .environmentObject(seasonsList)
    }
}
