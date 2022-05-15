//
//  PlayerViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/15.
//
import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    static var identifier = "PlayerViewController"
    
    let player = AVPlayer()
    
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
    
    let playerView: PlayerView = {
        let playerView = PlayerView()
        playerView.backgroundColor = .red
        return playerView
    }()
    
    let controlView: UIView = {
       
        let controlerView = UIView()
        controlerView.backgroundColor = .clear
        return controlerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.player = player
        setUp()
        play()
    }
    
    // 가로모드로 강제 조절
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    func setUp() {
        view.addSubview(controlView)
        view.addSubview(playerView)
        controlView.addSubview(playBtn)
        controlView.addSubview(backBtn)

        playerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        controlView.snp.makeConstraints {
            $0.top.leading.width.height.equalTo(playerView)
        }
        
        playBtn.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        backBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        self.view.bringSubviewToFront(self.controlView)
    }
    
    @objc func backBtnClicked() {
        reset()
        dismiss(animated: true)
    }
    
    @objc func playBtnClicked() {
        
        if player.isPlaying {
            pause()
            print("--> player is playing")
        } else {
            print("--> player is pausing")
            play()
        }
    }
}

extension PlayerViewController {
    func play() {
        player.play()
        playBtn.isSelected = true
    }
    
    func pause() {
        player.pause()
        playBtn.isSelected = false
    }
    
    func reset() {
        pause()
        player.replaceCurrentItem(with: nil)
    }
}
extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}
