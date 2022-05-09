//
//  RecommendCell.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/09.
//

import UIKit

struct DummyItem {
    let thumbnail: UIImage
}

class RecommentListViewModel {
    
    enum RecommendingType {
        case award
        case hot
        case my
        
        var titie: String {
            switch self {
            case .award: return "아카데미 호평 영화"
            case .hot: return "취향저격 HOT 콘텐츠"
            case .my: return "내가 찜한 콘텐츠"
            }
        }
    }
    
    private (set) var type: RecommendingType = .my
    private var items: [DummyItem] = []
    
    var numOfItems: Int {
        return items.count
    }
    
    func item(at index: Int) -> DummyItem {
        return items[index]
    }
    
    func updateType(_ type: RecommendingType) {
        self.type = type
    }
        
    func fetchItems() {
        self.items = MovieFetcher.fetch(type)
    }
}

class MovieFetcher {
    static func fetch(_ type: RecommentListViewModel.RecommendingType) -> [DummyItem] {
        switch type {
        case .award:
            let movies = (1..<10).map { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)")!) }
            return movies
        case .hot:
            let movies = (10..<19).map { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)")!) }
            return movies
        case .my:
            let movies = (1..<10).map { $0 * 2 }.map { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)")!) }
            return movies
        }
    }
}

class RecommendCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    
    func updateUI(movie: DummyItem) {
        thumbnailImage.image = movie.thumbnail
    }
}
