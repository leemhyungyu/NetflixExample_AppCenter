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
    
    static let pointSize: CGFloat = 25
    
    let label: UILabel = UILabel()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "img_header")
        iv.clipsToBounds = true
        
        return iv
    }()
    
    private let playBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("재생", for: .normal) 
        btn.setTitleColor(.black, for: .normal)
        btn.tintColor = .black
        btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        btn.backgroundColor = .white
        return btn
    }()

    private let plusBtn: UIButton = {
        
        let btn = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: pointSize)
        var config = UIButton.Configuration.plain()
        config.preferredSymbolConfigurationForImage = imageConfig
        
        btn.configuration = config
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.tintColor = .white
        
        return btn
    }()
    
    private let infoBtn: UIButton = {
        
        let btn = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: pointSize)
        var cofig = UIButton.Configuration.plain()
        cofig.preferredSymbolConfigurationForImage = imageConfig
        
        btn.configuration = cofig
        btn.setImage(UIImage(systemName: "info.circle"), for: .normal)
        btn.tintColor = .white
        
        return btn
    }()
    
    override func layoutSubviews() {
        setUp()
    }
    
    private func setUp(){
        addSubview(imageView)
        addSubview(playBtn)
        addSubview(plusBtn)
        addSubview(infoBtn)
        
        plusBtn.snp.makeConstraints {
            $0.trailing.equalTo(playBtn.snp.leading).offset(-50)
            $0.centerY.equalTo(playBtn)
        }
        
        infoBtn.snp.makeConstraints {
            $0.leading.equalTo(playBtn.snp.trailing).offset(50)
            $0.centerY.equalTo(playBtn)
        }
        playBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
    }
  }
