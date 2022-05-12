//
//  HomeTopCell.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/12.
//

import UIKit
import SnapKit

class HomeTopCell: UICollectionViewCell {
    
    static let identifier = "HomeTopCell"
    
    let label: UILabel = UILabel()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "img_header")
        iv.clipsToBounds = true
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUp(){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
  }
