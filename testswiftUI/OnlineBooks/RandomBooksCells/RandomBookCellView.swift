//
//  RandomBookCell.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 16/06/2022.
//

import SwiftUI
import Kingfisher

struct RandomBookCellView: View {

    var model: PodcastModel

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            KFImage(URL(string: model.CoverImage ?? ""))
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
            Text(model.name)
                .font(FontsManager.fontSmall)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 85)

            Spacer()
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: 100)
    }
}

struct RandomBookCellView_Previews: PreviewProvider {
    static var previews: some View {
        RandomBookCellView(model: MockedData.randomBooksList.first!)
    }
}
