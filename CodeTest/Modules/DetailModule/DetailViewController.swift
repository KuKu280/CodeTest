//
//  DetailViewController.swift
//  CodeTest
//
//  Created Ku Ku Zan on 9/25/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit


class DetailViewController: UIViewController {
    
    // MARK: Delegate initialization
    var presenter: DetailViewToPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var durationView: UIView!
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var codeNoLabel: UILabel!
    
    @IBOutlet weak var addCalendarBtn: UIButton!
    @IBOutlet weak var extendBtn: UIButton!
    @IBOutlet weak var getDirectionBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    
    @IBOutlet weak var carListCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: Custom initializers go here
    var detailList : CarListObject?
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.started()
        setupDataBind()
    }
    
    // MARK: User Interaction - Actions & Targets
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Additional Helpers
    fileprivate func setupUI() {
        durationView.dropShadow()
        addCalendarBtn.buttonBorderSetup()
        extendBtn.buttonBorderSetup()
        getDirectionBtn.buttonBorderSetup()
        moreBtn.buttonBorderSetup()
        setupCollectionView()
        pageControl.numberOfPages = 5
    }
    
    fileprivate func setupDataBind() {
        self.titleLable.text = detailList?.carName
        self.codeNoLabel.text = detailList?.codeNo
    }
    
    fileprivate func setupCollectionView() {
        carListCollectionView.delegate = self
        carListCollectionView.dataSource = self
        carListCollectionView.registerCell(type: CarListCollectionViewCell.self)
    }
}

// MARK: - Extension
/**
 - CollectionView DataSource & Delegate
 */
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarListCollectionViewCell.identifier, for: indexPath)as? CarListCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}

extension DetailViewController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

// MARK: - Presenter to View
extension DetailViewController: DetailPresenterToViewProtocl {
    
    func initialControlSetup() {
        setupUI()
    }
    
}
