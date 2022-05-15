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
        
        infoBtn.translatesAutoresizingMaskIntoConstraints = false
        infoBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16).isActive = true
        infoBtn.centerYAnchor.constraint(equalTo: playBtn.centerYAnchor).isActive = true
        infoBtn.leadingAnchor.constraint(equalTo: playBtn.trailingAnchor, constant: 50).isActive = true
        
        
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        plusBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16).isActive = true
        plusBtn.centerYAnchor.constraint(equalTo: playBtn.centerYAnchor).isActive = true
        
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        playBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        playBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        playBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        playBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16).isActive = true
        playBtn.leadingAnchor.constraint(equalTo: plusBtn.trailingAnchor, constant: 50).isActive = true


        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 466).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
  }
