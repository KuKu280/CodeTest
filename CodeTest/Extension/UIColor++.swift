//
//  UIColor++.swift
//  CodeTest
//
//  Created by Ku Ku Zan on 9/25/22.
//

import UIKit

extension UIColor {
    
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
    
}
