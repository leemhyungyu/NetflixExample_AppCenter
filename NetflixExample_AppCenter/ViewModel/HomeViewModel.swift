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

enum SectionType: CaseIterable{
    case home
    case award
    case hot
    case my
    
    var title: String {
        switch self {
        case .award: return "아카데미 호평 영화"
        case .hot: return "취향저격 HOT 콘텐츠"
        case .my: return "내가 찜한 콘텐츠"
        case .home: return ""
        }
    }
}

class RecommentListViewModel {
    
    var awardItem = (1..<10).map { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)")!) }
    var hotItem = (10..<19).map { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)")!) }
    var myItem = (1..<10).map { $0 * 2 }.map { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)")!) }
}

