//
//  OnlineBooksSubViews.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 18/06/2022.
//

import SwiftUI

struct OnlineBooksSubViews: View {

    var list: [PodcastModel] = []

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<list.count, id: \.self) { index in
                BookDetailsView(book: list[index])
            }
        }
        .background(Color.iqBackground)
    }
}

struct OnlineBooksSubViews_Previews: PreviewProvider {
    static var previews: some View {
        OnlineBooksSubViews(list: MockedData.randomBooksList)
    }
}
