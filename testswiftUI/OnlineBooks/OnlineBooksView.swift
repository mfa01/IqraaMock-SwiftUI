//
//  OnlineBooksView.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 23/05/2022.
//

import Foundation
import SwiftUI

struct OnlineBooksView: View {

    @State var booksList: [PodcastModel] = []
    @State var randomBookslist: [PodcastModel] = []
    @State private var searchText = ""

    var searchResults: [PodcastModel] {
        if searchText.isEmpty {
            return booksList
        } else {
            return booksList.filter { $0.name.contains(searchText) }
        }
    }

    var body: some View {
        VStack {
            List {
                Section(header: IqraaSectionHeaderView(title: "RandomBooksTitle".localized)) {
                    RandomBooksComponentView(list: randomBookslist)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                Section(header: IqraaSectionHeaderView(title: "OnlineBooksTitle".localized)) {
                    OnlineBooksSubViews(list: searchResults)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            }
        }
        .onAppear() {
            NetworkHelper.shared.getBooksData { data in
                self.booksList = data
            }
            NetworkHelper.shared.getRandomBooksData { data in
                self.randomBookslist = data
            }
        }
        .searchable(text: $searchText, placement:
                .navigationBarDrawer(displayMode: .always), prompt: "Looking for a book?".localized)
        .navigationTitle("Iqraa App".localized)
        .toolbar {
            Button("Purchases".localized) {
                print("Purchases tapped!")
            }.font(FontsManager.fontSmall)
        }
        .background(Color.iqBackground)

    }
}

struct OnlineBooksView_Preview: PreviewProvider {
    static var previews: some View {
        OnlineBooksView()
    }
}
