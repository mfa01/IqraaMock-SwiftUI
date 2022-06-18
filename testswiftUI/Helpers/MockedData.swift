//
//  MockedData.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 31/05/2022.
//

import Foundation

struct MockedData {

    static var randomBooksList: [PodcastModel] {
        let data1 = PodcastModel(name: "podscast 1 test very long name maybe it will need more than three lines", url: "https://metacode.biz/@test/avatar.jpg")
        let data2 = PodcastModel(name: "podscast 2", url: "https://www.aihr.com/wp-content/uploads/hr-podcasts-cover-1000x553-1.png")
        let data3 = PodcastModel(name: "podscast 3", url: "https://hatrabbits.com/wp-content/uploads/2018/10/risky-assumptions.jpg")
        let data4 = PodcastModel(name: "podscast 4", url: "https://arhsnewspaper.com/wp-content/uploads/2016/12/test.jpg")
        return [data1,data2,data3,data4]
    }
}
