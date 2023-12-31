import SwiftUI

struct SerieDetailView: View {
    @Binding var show: Show
    @Binding var selectedEpisode: Episode?
    @EnvironmentObject var showsData: ShowsData
    @EnvironmentObject var seasonsList: SeasonsData

    var body: some View {
        VStack {
            ScrollView {
                topImageTitleView
                scheduleView
                Divider()
                summaryView
                Divider()
                genresView
                Divider()
                seasonsListView
                Spacer()
            }
        }
    }

    private var topImageTitleView: some View {
        let height = 200.0

        return ZStack(alignment: .bottomLeading) {
            ImageLoader(url: show.largeImageURL)
                .frame(height: height, alignment: .top)
                .clipped()

            Rectangle()
                .frame(height: height)
                .background {
                    LinearGradient(
                        colors: [.clear, .black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                }
                .opacity(0.25)

            VStack(alignment: .leading) {
                Text(show.name)
                    .font(.title3)
                Text(show.status)
                    .font(.footnote)
            }
            .foregroundColor(.white)
            .padding(8.0)
        }
    }

    private var genresView: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text("Genres")
                .font(.footnote)
                .bold()
                .padding([.leading, .trailing], 8)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(show.genres, id: \.self) { genre in
                        TextPill(text: genre)
                    }
                }
                .padding([.leading, .trailing], 8)
            }
        }
    }

    private var summaryView: some View {
        Text(show.summary.htmlTagsRemoved)
            .font(.footnote)
            .padding(8)
    }

    private var seasonsListView: some View {
        VStack(alignment: .leading) {
            Text("Episodes")
                .font(.footnote)
                .bold()

            if seasonsList.isLoading {
                ProgressView()
            } else {
                SeasonListView(seasons: $seasonsList.seasons, selectedEpisode: $selectedEpisode)
            }
        }
        .padding([.leading, .trailing], 8)
    }

    private var scheduleView: some View {
        HStack(spacing: 8.0) {
            Text("\(Icon.calendar.image) \(show.scheduleDays.joined(separator: " | "))")
            Text("\(Icon.clock.image) \(show.scheduleTime)")
            Spacer()
        }
        .font(.footnote)
        .padding(8)
    }
}

struct SerieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SerieDetailView(show: .constant(.fixture()), selectedEpisode: .constant(nil))
            .environmentObject(SeasonsData())
    }
}
