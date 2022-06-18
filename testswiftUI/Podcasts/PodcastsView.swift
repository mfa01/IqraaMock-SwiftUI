//
//  PodcastsView.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 23/05/2022.
//

import Foundation
import SwiftUI

struct PodcastsView: View {
    var body: some View {
        List(1...100, id: \.self) { index in
            NavigationLink(
                destination: PodcastDetails(index: index),
                label: {
                    Text("Item #\(index)")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                })
        }
        .background(.red)
    }
}


