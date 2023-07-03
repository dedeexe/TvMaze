import SwiftUI

enum Icon: String {
    case calendar
    case clock
    case chevronUp = "chevron.up"
    case chevronDown = "chevron.down"

    var image: Image {
        Image(systemName: rawValue)
    }
}
