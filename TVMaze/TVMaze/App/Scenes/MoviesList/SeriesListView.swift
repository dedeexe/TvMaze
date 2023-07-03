import SwiftUI

struct SeriesListView: View {
    @EnvironmentObject var showsData: ShowsData

    var body: some View {
        ScrollView{
            LazyVStack(spacing: 8.0) {
                ForEach(showsData.shows) { show in
                    NavigationLink {
                        SerieDetailContainerView(
                            show: show,
                            showsData: showsData
                        )
                    } label: {
                        SerieInfoView(show: show)
                    }
                    .accentColor(Color.black)
                }

                if !showsData.isLoading {
                    loadingView
                }
            }
            .padding(8.0)
        }
        .refreshable {
            showsData.reset()
            showsData.load()
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
