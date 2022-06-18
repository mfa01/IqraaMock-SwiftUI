//
//  IqraaSectionHeaderView.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 18/06/2022.
//

import SwiftUI

struct IqraaSectionHeaderView: View {

    var title: String

    init(title: String) {
        self.title = title
    }

    var body: some View {
        Text(title).font(FontsManager.fontSmall)
    }
}

struct IqraaSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        IqraaSectionHeaderView(title: "hello guys")
    }
}
