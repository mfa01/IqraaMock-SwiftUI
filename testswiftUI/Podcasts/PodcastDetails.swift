//
//  PodcastDetails.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 23/05/2022.
//

import Foundation
import SwiftUI

struct PodcastDetails: View {

    var index = 0
    init (index: Int) {
        self.index = index
    }
    var body: some View {
        Text("Item #\(index) Details")
    }
}
