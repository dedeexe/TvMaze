import SwiftUI

struct SeasonView: View {
    @Binding var season: Season
    @Binding var selectedEposide: Episode?

    var body: some View {
        VStack(alignment: .leading) {

            Button {
                season.expanded.toggle()
            } label: {
                HStack {
                    Text("Season \(season.number) \(chevronDirection)")
                        .font(.body)
                        .foregroundColor(.black)
                        .bold()

                    Spacer()

                    Text("\(season.episodesCount) episodes")
                        .font(.callout)
                        .foregroundColor(.gray)
                        .italic()
                }
            }

            if season.expanded {
                ForEach(season.episodes, id: \.self) { episode in
                    VStack {
                        Divider()
                        HStack {
                            Text("\(episode.number). \(episode.name)")
                                .font(.callout)
                            Spacer()
                            Text("\(Image(systemName: "calendar")) \(episode.date)")
                                .font(.footnote)
                                .frame(width: 150)
                        }
                        .padding([.leading, .bottom, .top], 5)
                    }.onTapGesture {
                        selectedEposide = episode
                    }
                }
            }
        }
    }

    var chevronDirection: Image {
        if season.expanded {
            return Image(systemName: "chevron.up")
        }
        return Image(systemName: "chevron.down")
    }
}

struct SeasonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SeasonView(
                season: .constant(
                    Season(
                        season: 1,
                        episodes: [
                            .fixture(season: 1),
                            .fixture(season: 1),
                            .fixture(season: 1),
                            .fixture(season: 1),
                            .fixture(season: 1),
                            .fixture(season: 2),
                            .fixture(season: 2),
                            .fixture(season: 3)
                        ],
                        expanded: false
                    )
                ),
                selectedEposide: .constant(nil)
            )
            .previewLayout(.fixed(width: 300, height: 40))

            SeasonView(
                season: .constant(
                    Season(
                        season: 2,
                        episodes: [
                            .fixture(season: 1),
                            .fixture(season: 1),
                            .fixture(season: 1),
                            .fixture(season: 1),
                            .fixture(season: 1),
                            .fixture(season: 2),
                            .fixture(season: 2),
                            .fixture(season: 3)
                        ],
                        expanded: true
                    )
                ),
                selectedEposide: .constant(nil)
            )
            .previewLayout(.fixed(width: 300, height: 400))
        }
    }
}
