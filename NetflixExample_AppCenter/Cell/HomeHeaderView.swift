//
//  headerView.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/13.
//

import UIKit

class HomeHeaderView: UICollectionReusableView {
    
    static let identifier = "HomeHeaderView"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    override func layoutSubviews() {
       setUp()
    }
    
    func setUp() {
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        
//        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
    }
    
}
