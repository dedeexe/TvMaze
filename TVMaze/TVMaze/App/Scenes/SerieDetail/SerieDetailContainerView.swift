import SwiftUI

struct SerieDetailContainerView: View {
    @State var show: Show
    @ObservedObject var showsList: ShowsList
    @StateObject var seasonsList = SeasonsList()

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
