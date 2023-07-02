import SwiftUI

struct AppView: View {

    var body: some View {
        NavigationStack {
            SeriesListContainerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
