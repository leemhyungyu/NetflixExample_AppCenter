//
//  SearchViewController.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/12.
//
import UIKit
import Kingfisher
import AVFoundation

class SearchViewController: UIViewController {

    let viewModel = SearchViewModel()
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        return searchBar
        
    }()
    
    var collectionView: UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    func setUp() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self

        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalTo(searchBar.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let margin: CGFloat = 8
        let itemSpacing: CGFloat = 3
        let width = (collectionView.bounds.width - margin * 2 - itemSpacing * 2) / 3
        let height = width * 10/7
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = URL(string: viewModel.movies[indexPath.item].previewURL)!
        let item = AVPlayerItem(url: url)
        
        let playerVC = PlayerViewController()
        playerVC.modalPresentationStyle = .fullScreen
        present(playerVC, animated: true)
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else { return UICollectionViewCell() }
        
        let movie = viewModel.movies[indexPath.item]
        let url = URL(string: movie.thumbnailPath)!
        searchCell.imageView.kf.setImage(with: url)
        
        return searchCell
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
        
        SearchViewModel.search(searchTerm) { movies in
            DispatchQueue.main.async {
                self.viewModel.movies = movies
                self.collectionView.reloadData()
            }
        }
        print("--> 검색어: \(searchTerm)")
    }
}


