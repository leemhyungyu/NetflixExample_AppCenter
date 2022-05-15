//
//  PlayerViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/15.
//
import UIKit

class PlayerViewController: UIViewController {

    static var identifier = "PlayerViewController"
    
    let playBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 30)
        
        let btn = UIButton()
        btn.configuration = config
        btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        btn.setImage(UIImage(systemName: "pause.fill"), for: .selected)
        btn.tintColor = .white
        
        btn.addTarget(self, action: #selector(playBtnClicked), for: .touchUpInside)
        
        return btn
    }()
    
    let backBtn: UIButton = {
        let btn = UIButton()
        var config = UIButton.Configuration.plain()
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 24)
        
        btn.configuration = config
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(backBtnClicked), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        view.addSubview(playBtn)
        view.addSubview(backBtn)
        
        playBtn.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        backBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    @objc func backBtnClicked() {
        dismiss(animated: true)
    }
    
    @objc func playBtnClicked() {
        playBtn.isSelected = !playBtn.isSelected
        
    }
}
