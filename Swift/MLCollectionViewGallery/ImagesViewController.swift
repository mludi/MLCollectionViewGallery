//
//  ViewController.swift
//  MLCollectionViewGallery
//
//  Created by Matthias Ludwig on 10/05/16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController {
    
    fileprivate var collectionView: UICollectionView?
    fileprivate var pageControl: UIPageControl?
    
    fileprivate var images = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        for i in 1...6 {
            guard let image = UIImage(named: "\(i).jpg") else { continue }
            images.append(image)
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        guard let collectionView = collectionView else { fatalError("we need a collection view!") }
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.register(MLCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.showsHorizontalScrollIndicator = false
        
        pageControl = UIPageControl()
        guard let pageControl = pageControl else { fatalError("we need a pageControl") }
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.tintColor = UIColor.blue
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        let views = ["collectionView": collectionView, "pageControl": pageControl]
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "|[collectionView]|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[collectionView]-[pageControl]-|", options: [.alignAllLeading, .alignAllTrailing], metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
        
        
        
    }
    
}

extension ImagesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MLCollectionViewCell else { return UICollectionViewCell() }
        cell.theImageView.image = images[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = collectionView else { fatalError("we need a collection view!") }
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
            pageControl?.currentPage = visibleIndexPath.row
        }
        
        
    }
    
}
