//
//  ImageLoader.swift
//  TVMaze
//
//  Created by dede.exe on 02/07/23.
//

import SwiftUI

struct ImageLoader: View {
    var url: URL?
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
        } placeholder: {
            ZStack {
                Image("movie_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .opacity(0.3)
                ProgressView()
            }
        }
    }
}

struct ImageLoader_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoader()
    }
}
