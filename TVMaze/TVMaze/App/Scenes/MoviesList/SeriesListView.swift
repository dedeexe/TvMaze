import SwiftUI

struct SeriesListView: View {
    @EnvironmentObject var showsData: ShowsData
    @State private var selectedShow: Show?

    var body: some View {
        ScrollView{
            LazyVStack(spacing: 8.0) {
                ForEach(showsData.shows) { show in
                    SerieInfoView(show: show)
                        .onTapGesture { selectedShow = show }
                        .sheet(item: $selectedShow) { show in
                            SerieDetailContainerView(
                                show: show,
                                showsData: showsData
                            )
                        }
                }

                if !showsData.isLoading {
                    loadingView
                }
            }
            .padding(8.0)
        }
    }

    private var loadingView: some View {
        Text("Is Loading ***")
            .onAppear(perform: showsData.load)
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesListView()
            .environmentObject(ShowsData(serviceLocator: ServiceLocatorFactory.mocked))
    }
}
