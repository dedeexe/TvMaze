import SwiftUI

struct EpisodeDetailView: View {
    let episode: Episode
    let show: Show

    var body: some View {
        VStack {
            ScrollView {
                topImageTitleView
                summaryView
            }
        }
    }

    var topImageTitleView: some View {
        let height = 200.0

        return ZStack(alignment: .bottomLeading) {
            ImageLoader(url: episode.imageURL)
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
                    .font(.callout)

                Spacer()

                Text(episode.name)
                    .font(.title3)
                    .bold()
                Text("Season \(episode.season) | Episode \(episode.number)")
                    .font(.footnote)
            }
            .foregroundColor(.white)
            .padding(8.0)
        }
    }


    var summaryView: some View {
        Text(episode.summary.htmlTagsRemoved)
            .font(.caption)
            .padding(4.0)
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(episode: .fixture(), show: .fixture())
    }
}
