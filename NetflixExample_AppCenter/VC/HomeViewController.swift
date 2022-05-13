//
//  ViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/08.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDataSource {


    let viewModel = RecommentListViewModel()
    
    private let collectionViewControllerCellId = "HomeTopCell"
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex,envi) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0: return self.homeFirstCreateCompositionalLayout()
            default: return self.homeSecondCreateCompositionalLayout()
            }
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(HomeTopCell.self, forCellWithReuseIdentifier: HomeTopCell.identifier)
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        collectionView.register(headerView.self, forSupplementaryViewOfKind: headerView.identifier, withReuseIdentifier: headerView.identifier)
        
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

        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true

    }
    
    
    func homeSecondCreateCompositionalLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(120.0), heightDimension: .absolute(160.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(160.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let titleHeader = createTitleHeaderLayout()
        
        section.boundarySupplementaryItems = [ titleHeader ]
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func homeFirstCreateCompositionalLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(466))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(466))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        
        return section
        
    }
    
    func createTitleHeaderLayout() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)

        return header
    }
}

  extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
      
      func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 4
      }

      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    

          switch section {
          case 0:
              return 1
          case 1:
              return viewModel.awardItem.count
          case 2:
              return viewModel.hotItem.count
          case 3:
              return viewModel.myItem.count
          default:
              return 0

          }
    }
    
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

          guard let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTopCell.identifier, for: indexPath) as? HomeTopCell else { return UICollectionViewCell() }
        
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else { return UICollectionViewCell() }
        
          switch indexPath.section {
          case 0:
              return topCell
          case 1:
              let movies = viewModel.awardItem
              cell.movieImage.image = movies[indexPath.row].thumbnail
              return cell
        
          case 2:
              let movies = viewModel.hotItem
              cell.movieImage.image = movies[indexPath.row].thumbnail
              return cell
            
          case 3:
              let movies = viewModel.myItem
              cell.movieImage.image = movies[indexPath.row].thumbnail
              return cell
            
          default:
              return UICollectionViewCell()
        }
    }
}
