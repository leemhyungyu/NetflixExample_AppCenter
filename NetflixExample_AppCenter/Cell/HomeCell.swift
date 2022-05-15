//
//  HomeCell.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/12.
//

import UIKit

class HomeCell: UICollectionViewCell {
 
    static let identifier = "HomeCell"
    
    var movieImage: UIImageView = {
       
        let imageView = UIImageView()
        
        return imageView
    }()
    
    
    override func layoutSubviews() {
        setUp()
        
    }
    func setUp() {
        addSubview(movieImage)
        
        movieImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
