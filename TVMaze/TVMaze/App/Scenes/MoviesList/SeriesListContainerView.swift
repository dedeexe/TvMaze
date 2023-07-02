import SwiftUI

struct SeriesListContainerView: View {
    @StateObject var showsList = ShowsData()
    @State var firstTime: Bool = false

    var body: some View {
        VStack {
            if showsList.isFirstLoading {
                ProgressView()
                    .onAppear { showsList.load() }
            } else {
                SeriesListView()
                    .environmentObject(showsList)
            }
        }
        .navigationTitle("Shows")
    }
}

struct MovieListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesListContainerView(showsList: ShowsData())
    }
}
