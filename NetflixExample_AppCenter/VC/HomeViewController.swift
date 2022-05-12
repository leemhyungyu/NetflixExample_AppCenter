//
//  ViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/08.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDataSource {


    private let collectionViewControllerCellId = "HomeTopCell"
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(HomeTopCell.self, forCellWithReuseIdentifier: HomeTopCell.identifier)

        return collectionView
    }()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      setup()
    }
    
    // MARK: - Handlers
    func setup() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = false

        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
  }

  extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewControllerCellId, for: indexPath) as! HomeTopCell
      return cell
    }
  }
