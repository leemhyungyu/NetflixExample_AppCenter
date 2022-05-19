
//  PlayerViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/15.
//
import UIKit
import AVFoundation

class PlayerViewController: UIViewController, UIGestureRecognizerDelegate {

    static var identifier = "PlayerViewController"
    
    let player = AVPlayer()
    
    // 재생 버튼
    lazy var playBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 30)
        
        let btn = UIButton()
        btn.configuration = config
        btn.tintColor = .white
        
        // 해당 버튼이 클릭되었을 때 playBtnClicked함수가 실행되게함
        btn.addTarget(self, action: #selector(playBtnClicked), for: .touchUpInside)
        
        return btn
    }()
    
    // 'X' 버튼
    // 초기화를 위해 lazy var로 선언
    lazy var backBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 24)

        let btn = UIButton()
        btn.configuration = config
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .white
        // 해당 버튼이 클릭되었을 때 backBtnClicked함수가 실행되게함
        btn.addTarget(self, action: #selector(backBtnClicked), for: .touchUpInside)
        
        return btn
    }()
    
    // player가 들어있는 playerView
    let playerView: PlayerView = {
        let playerView = PlayerView()
        
        return playerView
    }()
    
    // playerView 앞에 있는 controlView
    let controlView: UIView = {
        let controlView = UIView()
        
        // 뷰의 배경색을 투명하게 바꿔줌
        controlView.backgroundColor =  UIColor(white: 0, alpha: 0.01)
        return controlView
    }()

    // 빈 공간 클릭시 함수를 실행하기 위한 제스쳐
    lazy var geusture: UITapGestureRecognizer = {
    
        let geusture = UITapGestureRecognizer(target: self, action: #selector(tapBG(_:)))
        
        return geusture
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
    
    // 'X'버튼이 클릭되었을 때 실행되는 함수
    @objc func backBtnClicked() {
        reset()
        dismiss(animated: true)
    }
    
    // play버튼이 클릭되었을 때 실행되는 함수
    @objc func playBtnClicked() {
        
        if player.isPlaying {
            pause()
            print("--> player is paseing")
        } else {
            print("--> player is palaying")
            play()
        }
    }
    
    // 빈공간이 클릭되었을 때 실행되는 함수
    @objc func tapBG(_ sender: UITapGestureRecognizer) {
        print("--> BG clicked")
        playBtn.isHidden = !playBtn.isHidden
        backBtn.isHidden = !backBtn.isHidden
    }
}

extension PlayerViewController {
    
    func setUp() {
        view.addSubview(controlView)
        view.addSubview(playerView)
        view.addGestureRecognizer(geusture)
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
        
        // controlView를 해당뷰의 가장앞으로 빼줌
        self.view.bringSubviewToFront(self.controlView)
    }
    
    // player를 재생시키고 playBtn의 이미지를 바꿔주는 함수
    func play() {
        player.play()
        playBtn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
    
    // player를 일시정지시키고 playBtn의 이미지를 바꿔주는 함수
    func pause() {
        player.pause()
        playBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    
    // player를 리셋시켜주는 함수
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
