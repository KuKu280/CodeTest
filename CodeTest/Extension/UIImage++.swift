//
//  UIImage++.swift
//  CodeTest
//
//  Created by Ku Ku Zan on 9/25/22.
//

import UIKit

extension UIImage{
    
    static func imageName(_ name: ImageAssets) -> UIImage? {
        return UIImage(named: name.rawValue)
    }
}
