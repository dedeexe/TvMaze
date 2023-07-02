//
//  TextPill.swift
//  TVMaze
//
//  Created by dede.exe on 02/07/23.
//

import SwiftUI

struct TextPill: View {
    let text: String
    var textColor: Color = .black
    var backgroundColor: Color = .blue

    var body: some View {
        Text(text)
            .lineLimit(1)
            .font(.footnote)
            .foregroundColor(.white)
            .padding([.top, .bottom], 4)
            .padding([.leading, .trailing], 10)
            .background{
                Capsule().foregroundColor(.blue)
            }
    }
}

struct TextPill_Previews: PreviewProvider {
    static var previews: some View {
        TextPill(text: "Text inside the Pill")
    }
}
