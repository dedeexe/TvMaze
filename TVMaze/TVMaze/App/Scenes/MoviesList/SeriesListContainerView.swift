import SwiftUI

struct SeriesListContainerView: View {
    @StateObject var showsData = ShowsData()
    @State var firstTime: Bool = false

    var body: some View {
        VStack {
            if showsData.isFirstLoading {
                ProgressView()
                    .onAppear { showsData.load() }
            } else {
                SeriesListView()
                    .environmentObject(showsData)
            }
        }
        .navigationTitle("Shows")
    }
}

struct MovieListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesListContainerView(showsData: ShowsData())
    }
}
