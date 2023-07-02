import SwiftUI

struct SerieDetailContainerView: View {
    @State var show: Show
    @ObservedObject var showsList: ShowsList

    var body: some View {
        SerieDetailView(show: $show)
            .onChange(of: show) { newValue in
                print(newValue)
            }
    }
}
