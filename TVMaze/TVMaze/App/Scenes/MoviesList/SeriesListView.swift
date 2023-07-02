import SwiftUI

struct SeriesListView: View {
    @EnvironmentObject var showsList: ShowsData
    @State private var selectedShow: Show?

    var body: some View {
        ScrollView{
            LazyVStack(spacing: 8.0) {
                ForEach(showsList.list) { show in
                    SerieInfoView(show: show)
                        .onTapGesture { selectedShow = show }
                        .sheet(item: $selectedShow) { show in
                            SerieDetailContainerView(
                                show: show,
                                showsList: showsList
                            )
                        }
                }

                if !showsList.isLoading {
                    loadingView
                }
            }
            .padding(8.0)
        }
    }

    private var loadingView: some View {
        Text("Is Loading ***")
            .onAppear(perform: showsList.load)
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesListView()
            .environmentObject(ShowsData(serviceLocator: ServiceLocatorFactory.mocked))
    }
}
