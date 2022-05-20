//
//  Search.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/15.
//

import UIKit

struct Movie: Codable {
    let title: String
    let director: String
    let thumbnailPath: String
    let previewURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case director = "artistName"
        case thumbnailPath = "artworkUrl100"
        case previewURL = "previewUrl"
    }
}

class SearchViewModel {
    
    var movies: [Movie] = []
    var searchAPI: APIService = APIService()
    
    var numOfSection: Int {
        return movies.count
    }
    
    func item(at index: Int) -> Movie {
        return movies[index]
    }
    
    // 후행 클로저를 이용해 view에서 CollectionView가 reload되도록 함
    // 후행 클로저 이용하지 않고 view에서 patchUI() 실행 후 reload하면 제대로 reload가 안됨
    func patchUI(searchTerm: String, action: @escaping () -> Void){
        searchAPI.search(searchTerm) { movies in
            DispatchQueue.main.async {
                self.movies = movies
                action()
            }
        }
    }
}

