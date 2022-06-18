//
//  RandomBooksCellView.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 31/05/2022.
//

import Foundation
import SwiftUI

struct RandomBooksComponentView: View {

    var list: [PodcastModel] = []

    var body: some View {

        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(list) { item in
                        NavigationLink(
                            destination: PodcastDetails(index: 0),
                            label: {
                                RandomBookCellView(model: item)
                        })
                    }
                }
            }
        }
        .background(Color.iqBackground)
        .listRowSeparator(.hidden)
    }

    init(list: [PodcastModel]) {
        self.list = list
    }
}

struct RandomBooksComponentView_Preview: PreviewProvider {
    static var previews: some View {
        RandomBooksComponentView(list: MockedData.randomBooksList)
    }
}
