//
//  UICollectionView++.swift
//  CodeTest
//
//  Created by Ku Ku Zan on 9/25/22.
//

import UIKit
extension UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionView {
    
    func registerCell(type: UICollectionViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: identifier ?? cellId)
    }
    
    func dequeueCell<T: UICollectionViewCell>(withType type: UICollectionViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
    
}
