//
//  SearchCell.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/15.
//

import UIKit

class SearchCell: UICollectionViewCell {

    static let identifier = "SearchCell"
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_movie_1")
        imageView.clipsToBounds = true
        return imageView
    }()

    override func layoutSubviews() {
        setUp()
    }
    private func setUp() {
        addSubview(imageView)
        

        imageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }

    }
}

