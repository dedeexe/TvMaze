import SwiftUI

struct SerieDetailContainerView: View {
    @State var show: Show
    @ObservedObject var showsList: ShowsList

    var body: some View {
        Text(show.name)
    }
}

//struct SerieDetailContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SerieDetailContainerView(
//            show: .fixture(),
//            showsList: ShowsList()
//        )
//    }
//}
