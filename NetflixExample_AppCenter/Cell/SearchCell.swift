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
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 128).isActive = true
    }
}

