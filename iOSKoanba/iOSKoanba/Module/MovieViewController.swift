//
//  MovieViewController.swift
//  iOSKoanba
//
//  Created by Irfan Adika on 19/03/21.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class MovieViewController: UIViewController {
    
    var presenter: MoviePresentation?
    var movie: [Movie]?
    weak var collectionView: UICollectionView!
    
    override func loadView() {
        super.loadView()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
        self.collectionView = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .white
        
        getNews()
    }
    
    private func getNews() {
        presenter?.getMovie()
    }
}

extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.movie?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        if let data = self.movie?[indexPath.item] {
            if let imageUrl = URL(string: Constants.URL_IMAGE + data.poster_path ){
                cell.image.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "Loading_Thumbnail"), options: .highPriority, completed: nil)
                
            }
        }
        
        return cell
    }
}

extension MovieViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: (width - 15)/2, height: (width - 15)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension MovieViewController: MovieView {
    func successGetMovie(data: [Movie]?) {
        self.movie = data
        collectionView.reloadData()
    }
    
    func showLoading() {
        Helper.starLoading(view: self.view)
    }
    
    func hideLoading() {
        Helper.stopLoading()
    }
    
    func showError(title: String, message: String) {
        
    }
    
    
}

