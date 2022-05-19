//
//  ViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/08.
//
import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDataSource {

    let viewModel = HomeViewModel()
        
    lazy var collectionView: UICollectionView = {
    
        // sectionIndex를 인자로 받아 NSCollectionLayoutSection타입을 반환하는 클로저
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return self.homeFirstCreateCompositionalLayout()
            default:
                return self.homeSecondCreateCompositionalLayout()
            }
        }
        
        // 위에 선언한 UICollectionViewCompositionalLayout을 collectionView의 layout으로 넣어줌
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // collectionView에 cell과 view를 등록해줌
        cv.register(HomeTopCell.self, forCellWithReuseIdentifier: HomeTopCell.identifier)
        cv.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        
        // HomeHeaderView는 kind 값을 elementKindSectionHeader로 넣어줌 -> 헤더로 사용하기 위해
        cv.register(HomeHeaderView.self, forSupplementaryViewOfKind:
                                    UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderView.identifier)
        
        return cv
    }()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      setup()
    }
    
    func setup() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // 첫번쨰 cell의 NSCollectionLayoutSection을 반환해주는 함수
    func homeFirstCreateCompositionalLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(466))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(480))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        
        return section
        
    }
    
    // 나머지 cell의 NSCollectionLayoutSection을 반환해주는 함수
    func homeSecondCreateCompositionalLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(120.0), heightDimension: .absolute(160.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1.5, bottom: 1, trailing: 1.5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(160.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [ sectionHeader ]
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
}

  extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
      
      // 섹션의 개수를 반환하는 메소드
      func numberOfSections(in collectionView: UICollectionView) -> Int {
          return viewModel.numOfSection
      }

      // 섹셩단 아이템의 개수를 반환하는 메소드
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          
          switch section {
              
          case 0:
              return 1
              
          case 1:
              return viewModel.numOfItem(at: section)
              
          case 2:
              return viewModel.numOfItem(at: section)
              
          case 3:
              return viewModel.numOfItem(at: section)
              
          default:
              return 0
          }
      }
      
      // 섹션의 헤더를 반환하는 메소드
      func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
   
          guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderView.identifier, for: indexPath) as? HomeHeaderView else { return UICollectionReusableView() }
          
          switch indexPath.section {
          case 1:
//              header.titleLabel.text = SectionType.award.title
              header.titleLabel.text = viewModel.titleOfSection(at: indexPath.section)

              return header
          case 2:
//              header.titleLabel.text = SectionType.hot.title
              header.titleLabel.text = viewModel.titleOfSection(at: indexPath.section)

              return header
          case 3:
//              header.titleLabel.text = SectionType.my.title
              header.titleLabel.text = viewModel.titleOfSection(at: indexPath.section)

              return header
          default:
              header.titleLabel.text = viewModel.titleOfSection(at: indexPath.section)
              return header
          }
      }
    
      // collectionView의 섹션마다의 cell정보를 반환하는 메소드
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

          guard let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTopCell.identifier, for: indexPath) as? HomeTopCell else { return UICollectionViewCell() }
        
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else { return UICollectionViewCell() }
        
          switch indexPath.section {
              
          case 0:
              return topCell
              
          case 1:
              let item = viewModel.item(at: indexPath.section)
              cell.movieImage.image = item[indexPath.row].thumbnail
              return cell
        
          case 2:
              let item = viewModel.item(at: indexPath.section)
              cell.movieImage.image = item[indexPath.row].thumbnail
              return cell
            
          case 3:
              let item = viewModel.item(at: indexPath.section)
              cell.movieImage.image = item[indexPath.row].thumbnail
              return cell
            
          default:
              return UICollectionViewCell()
        }
    }
}
