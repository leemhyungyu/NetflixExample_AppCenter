//
//  ViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/08.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {

    var awardRecommendListViewController: RecommendListViewController!
    var hotRecommendListViewController: RecommendListViewController!
    var myRecommendListViewController: RecommendListViewController!
    
    // VC간의 데이터 전달을 하기 위해 prepare메소드를 사용.
    // 전달해야하는 VC을 구분지어 데이터를 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        if segue.identifier == "award" {
            // RecommendListVC에 데이터를 전달하기 위해 prepare() 메소드 사용.
            
            // segue.destination을 RecommendListViewController 타입으로 다운캐스팅을 해 detintaionVC에 넣는다.
            // destinationVC가 RecommendListVC이 된다.
            // destinationVC를 awardRecommendListViewController에 넣어서 데이터 전달
            // 어떤 데이터를 전달?
            let destinationVC = segue.destination as? RecommendListViewController
            awardRecommendListViewController = destinationVC
            // 해당 VC의 타입이 .award라는 것을 전달
            awardRecommendListViewController.viewModel.updateType(.award)
            // 해당 VC에 UIImage객체를 전달
            awardRecommendListViewController.viewModel.fetchItems()
        } else if segue.identifier == "hot" {
            let destinationVC = segue.destination as? RecommendListViewController
            hotRecommendListViewController = destinationVC
            hotRecommendListViewController.viewModel.updateType(.hot)
            hotRecommendListViewController.viewModel.fetchItems()
        } else if segue.identifier == "my" {
            let destinationVC = segue.destination as? RecommendListViewController
            myRecommendListViewController = destinationVC
            myRecommendListViewController.viewModel.updateType(.my)
            myRecommendListViewController.viewModel.fetchItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

