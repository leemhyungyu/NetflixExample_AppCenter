//
//  APIService.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/20.
//

import Foundation

struct Response: Codable {
    let resultCount: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}

class APIService {
    
    func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        
        let session = URLSession(configuration: .default)
        var UrlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
        let mediaQuery = URLQueryItem(name: "media", value: "moive")
        let entityQuery = URLQueryItem(name: "entity", value: "movie")
        let termQuery = URLQueryItem(name: "term", value: term)
        UrlComponents.queryItems = [mediaQuery, entityQuery, termQuery]
        
        let requestURL = UrlComponents.url!
         
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode, successRange.contains(statusCode) else { return completion([]) }
            guard let resultData = data else { return completion([]) }
            
            let movies = APIService.parseMovie(resultData)
            
            completion(movies)
        }
        dataTask.resume()
    }
    
    static func parseMovie(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(Response.self, from: data)
            let movies = response.movies
            return movies
        } catch let error {
            print("error: \(error.localizedDescription)")
            return []
        }
    }
}
