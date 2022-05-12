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
    
    // 해당 RecommendVC이 가지고 있는 item의 개수
    var numOfItems: Int {
        return items.count
    }
    
    // item객체의 index번째 값을 반환해주는 함수
    func item(at index: Int) -> DummyItem {
        return items[index]
    }
    
    // 해당 RecommendVC의 타입을 입력받은 type으로 바꿔주는 함수
    func updateType(_ type: RecommendingType) {
        self.type = type
    }
        
    // 해당 RecommendVC의 items배열의 값을 설정해주는 함수
    func fetchItems() {
        self.items = MovieFetcher.fetch(type)
    }
}

class MovieFetcher {
    static func fetch(_ type: RecommentListViewModel.RecommendingType) -> [DummyItem] {
        switch type {
        case .award:
            // Map 함수란 기존 데이터를 변형하여 새로운 컨테이너를 만드는데 사용, 기존 데이터는 변형되지 않는다.
            // Map 함수는 기존의 for-in 구문과 큰 차이가 없지만 Map함수를 사용하면 다음과 같은 이점이 있다.
            // 1. 코드의 간결성, 2. 재사용 용이, 3. 컴파일러 최적화 성능 좋음
            let Arrays = 1..<10
            var movies = [DummyItem]()
            for Array in Arrays {
                movies.append(DummyItem(thumbnail: UIImage(named: "img_movie_\(Array)")!))
            }
//            let movies = (1..<10).map { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)")!) }
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

//class RecommendCell: UICollectionViewCell {
//
//    @IBOutlet weak var thumbnailImage: UIImageView!
//    
//    func updateUI(movie: DummyItem) {
//        thumbnailImage.image = movie.thumbnail
//    }
//}
