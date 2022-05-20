//
//  Search.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/15.
//

import UIKit

struct Response: Codable {
    let resultCount: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}

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
    
    func patchUI(searchTerm: String, completion: @escaping () -> Void){
        searchAPI.search(searchTerm) { movies in
            DispatchQueue.main.async {
                self.movies = movies
                completion()
            }
        }
    }
    
    
}

