//
//  TabBarView.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 18/06/2022.
//

import SwiftUI

struct TabBarView: View {

    @State var selection = 0

    var body: some View {
        
        TabView(selection: $selection) {
            NavigationView {
                OnlineBooksView()
            }.tabItem {
                Text("Library".localized).font(FontsManager.fontSecondry)
                Image(systemName: "book")
            }
            .tag(0)

            NavigationView {
                PodcastsView().navigationTitle("Podcasts")
            }.tabItem {
                Text("Podcasts".localized).font(FontsManager.fontSecondry)
                Image(systemName: "video")
            }
            .tag(1)
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(Color.iqBackground)
        }
        .accentColor(Color("FontColor"))
        .foregroundColor(Color("FontColor"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
