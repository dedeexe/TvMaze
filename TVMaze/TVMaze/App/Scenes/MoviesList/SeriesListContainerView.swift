import SwiftUI

struct SeriesListContainerView: View {
    @StateObject var showsList = ShowsList()
    @State var firstTime: Bool = false

    var body: some View {
        VStack {
            if showsList.isFirstLoading {
                Text("Is Loading")
                    .onAppear {
                        showsList.load()
                    }
            } else {
                SeriesListView(showsList: showsList)
            }
        }
        .navigationTitle("Shows")
    }
}

struct MovieListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesListContainerView(showsList: ShowsList())
    }
}
