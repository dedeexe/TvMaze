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
                Rectangle()
                    .frame(width: 80, height: 80)

                VStack(alignment: .leading) {
                    Text(show.name)
                    Spacer()
                    Text(show.status)
                    Text("Rating:" + show.rating)
                }

                Spacer()
            }
        }
    }
}

struct SerieInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SerieInfoView(show: .fixture())
            .previewLayout(.fixed(width: 400, height: 120))
    }
}
