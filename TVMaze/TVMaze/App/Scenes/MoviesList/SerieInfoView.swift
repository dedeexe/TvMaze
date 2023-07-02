//
//  SerieInfoView.swift
//  TVMaze
//
//  Created by dede.exe on 01/07/23.
//

import SwiftUI

struct SerieInfoView: View {
    var show: Show
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                ImageLoader(url: show.imageURL)
                    .frame(width: 60, height: 80)
                    .clipped()

                VStack(alignment: .leading) {
                    Text(show.name).font(.callout.bold())
                    Text(genres).font(.footnote)
                    Spacer()
                    Text(show.status).font(.footnote)
                    Text("Rating:" + show.rating).font(.footnote)
                }

                Spacer()
            }
            Divider()
        }
    }

    var genres: String {
        show.genres.joined(separator: ", ")
    }
}

struct SerieInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SerieInfoView(show: .fixture())
            .previewLayout(.fixed(width: 400, height: 120))
    }
}
