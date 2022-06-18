//
//  testswiftUIApp.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 23/05/2022.
//

import SwiftUI

@main
struct testswiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear {
//                print(UserDefaults.standard.object(forKey: "AppleLanguages"))
//                UserDefaults.standard.set(["ar"], forKey: "AppleLanguages")
//                UserDefaults.standard.synchronize()
            }.environment(\.locale, Locale(identifier: "ar"))
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}
