import SwiftUI

struct SerieDetailView: View {
    @Binding var show: Show

    var body: some View {
        VStack {
            topImageTitleView
            ScrollView {
                summaryView
                Divider()
                genresView
                Spacer()
            }
        }
    }

    var topImageTitleView: some View {
        let height = 200.0

        return ZStack(alignment: .bottomLeading) {
            ImageLoader(url: show.imageURL)
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

    var genresView: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text("Genres")
                .font(.footnote)
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

    var summaryView: some View {
        Text(show.summary.htmlTagsRemoved)
            .font(.caption)
            .padding(4.0)
    }
}

struct SerieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SerieDetailView(show: .constant(.fixture()))
    }
}
