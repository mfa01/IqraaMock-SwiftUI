//
//  BookDetailsView.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 24/05/2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct BookDetailsView: View {

    var book: PodcastModel

    init (book: PodcastModel) {
        self.book = book
    }

    var body: some View {
        HStack(alignment: .center, spacing: 10) {

            KFImage(URL(string: book.CoverImage ?? ""))
                .placeholder {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 85, height: 120, alignment: .center)
                        .background(.white)
                    }
                .resizable()
                .scaledToFill()
                .frame(width: 85, height: 120, alignment: .center)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(book.category ?? "")
                    .foregroundColor(.gray)
                    .font(FontsManager.fontSecondry)

                Text(book.name)
                    .font(FontsManager.fontSmall)
                    .lineLimit(2)

                Spacer()

                HStack {
                    Text("0 MB")
                        .foregroundColor(.gray)
                        .font(FontsManager.fontSecondry)
                    Text("\(book.downloads ?? 0)")
                        .foregroundColor(.gray)
                        .font(FontsManager.fontSecondry)
                }
            }
            Spacer()
        }
    }
}

struct BookDetailsView_Preview: PreviewProvider {
    static var previews: some View {
        BookDetailsView(book: MockedData.randomBooksList.first!)
    }
}
