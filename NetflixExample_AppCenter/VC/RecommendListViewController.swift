//
//  RecommandListViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/09.
//

import UIKit
import AVFoundation

class RecommendListViewController: UIViewController {

    @IBOutlet weak var sectionLabel: UILabel!
    
    let viewModel = RecommentListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    // HomeVC에서 데이터 전달시에 받은 type값을 통해 VC의 Label.text값을 설정
    func updateUI() {
        sectionLabel.text = viewModel.type.titie
    }
}

    
extension RecommendListViewController: UICollectionViewDataSource {
    
    // 섹션당 item의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfItems
    }
    
    // item마다의 cell 정보
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 각 cell을 "RecommendCell"식별자인 RecommendCell을 렌더링하여 설정
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as? RecommendCell else {
            return UICollectionViewCell()
        }
        
        // viewModel.item에는 [DummyItem]이 들어있음
        let movie = viewModel.item(at: indexPath.item)
        // updateUI()를 이용해 [DummyImte]에 들어있는 thumbnail값으로 cell의 이미지를 업데이트시킴
        cell.updateUI(movie: movie)
        return cell
    }
}

extension RecommendListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 160)
    }
}



