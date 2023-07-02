import SwiftUI

struct SerieDetailContainerView: View {
    @State var show: Show
    @ObservedObject var showsList: ShowsData
    @StateObject var seasonsList = SeasonsData()

    var body: some View {
        SerieDetailView(show: $show)
            .onAppear { seasonsList.loadEpisodes(showId: show.id) }
            .onChange(of: show) { newValue in
                print(newValue)
            }
            .environmentObject(showsList)
            .environmentObject(seasonsList)
    }
}
