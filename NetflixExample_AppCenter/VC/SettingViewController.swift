//
//  SettingViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/12.
//
import UIKit

class SettingViewController: UIViewController {
    
    let label: UILabel = {
        
       let title = UILabel()
        
        title.text = "더보기"
        title.font = .systemFont(ofSize: 50)
        title.textColor = .black
        return title
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        setUp()
    }
    
    func setUp() {
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}

