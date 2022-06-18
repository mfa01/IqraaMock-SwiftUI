//
//  NetworkHelper.swift
//  testswiftUI
//
//  Created by Mohammad Alabed on 23/05/2022.
//

import Foundation

struct PodcastModel:Identifiable, Codable {
    var id = UUID()

    var name: String
    var text: String?
    var url: String?
    var downloads: Int?
    var CoverImage: String?
    var category: String?


}

class NetworkHelper {

    static var shared = NetworkHelper()

    var books: [PodcastModel] = []
    var randomBooks: [PodcastModel] = []

    func getPodcastsData(completion: (_ data: [PodcastModel]) -> Void) {
        let data1 = PodcastModel(name: "podscast 1", url: "https://www.aihr.com/wp-content/uploads/hr-podcasts-cover-1000x553-1.png")
        let data2 = PodcastModel(name: "podscast 2", url: "https://www.aihr.com/wp-content/uploads/hr-podcasts-cover-1000x553-1.png")
        let data3 = PodcastModel(name: "podscast 3", url: "https://www.aihr.com/wp-content/uploads/hr-podcasts-cover-1000x553-1.png")
        let data4 = PodcastModel(name: "podscast 4", url: "https://www.aihr.com/wp-content/uploads/hr-podcasts-cover-1000x553-1.png")
        completion([data1,data2,data3,data4])
    }

    func getBooksData(completion: @escaping(_ data: [PodcastModel]) -> Void) {

        print("fetch books")
        guard books.count == 0 else {
            completion(books)
            return
        }
        if let path = Bundle.main.path(forResource: "plus100-200downloads", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                var models: [PodcastModel] = []
                for snapshot in jsonResult as! [String: Any] {
                    let item = snapshot.value as! [String: Any]
                    let model = PodcastModel(name: (item["text"] as? String) ?? "", text: item["text"] as? String, url: item["url"] as? String, downloads: item["downloads"] as? Int, CoverImage: item["CoverImage"] as? String, category: item["category"] as? String)
                    models.append(model)
                    if models.count > 100 {
                        break
                    }
                }
                self.books = models
                DispatchQueue.main.async {
                    completion(models)
                }
            } catch {
                print("error")
            }
        }
    }

    func getRandomBooksData(completion: @escaping(_ data: [PodcastModel]) -> Void) {

        print("fetch random books")
        guard randomBooks.count == 0 else {
            completion(randomBooks)
            return
        }
        if let path = Bundle.main.path(forResource: "plus1000downloads", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                var models: [PodcastModel] = []
                for snapshot in jsonResult as! [String: Any] {
                    let item = snapshot.value as! [String: Any]
                    let model = PodcastModel(name: (item["text"] as? String) ?? "", text: item["text"] as? String, url: item["url"] as? String, downloads: item["downloads"] as? Int, CoverImage: item["CoverImage"] as? String, category: item["category"] as? String)
                    models.append(model)
                }
                self.randomBooks = models
                DispatchQueue.main.async {
                    completion(models)
                }
            } catch {
                print("error")
            }
        }
    }

}
