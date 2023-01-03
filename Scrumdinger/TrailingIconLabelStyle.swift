//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Jessi Zimmerman on 10/31/22.
//

import Foundation
import SwiftUI

struct TrailingLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self ==TrailingLabelStyle {
    static var trailingIcon: Self { Self() }
}

struct TrailingLabelStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Label("Title 1", systemImage: "star")
            Label("Title 2", systemImage: "square")
            Label("Title 3", systemImage: "circle")
        }
        .labelStyle(TrailingLabelStyle())
    }
}
