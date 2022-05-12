//
//  headerView.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/13.
//

import UIKit

class headerView: UICollectionReusableView {
    
    static let identifier = "headerView"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .heavy)
        
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .systemBackground
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(8)
        }
    }
    
}
