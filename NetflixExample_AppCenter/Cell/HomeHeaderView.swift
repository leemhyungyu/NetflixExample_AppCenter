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

        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
