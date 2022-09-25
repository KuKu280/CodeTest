//
//  UIButton.swift
//  CodeTest
//
//  Created by Ku Ku Zan on 9/25/22.
//

import UIKit

extension UIButton {
    func buttonBorderSetup() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 10
    }
    
    func setLeftImage(imageName:String, padding:CGFloat) {
            //Set left image
            let image = UIImage(named: imageName)
            self.setImage(image, for: .normal)

            //Calculate and set image inset to keep it left aligned
            let imageWidth = image?.size.width
            let textWidth = self.titleLabel?.intrinsicContentSize.width ?? 0
            let buttonWidth = self.bounds.width

            let padding:CGFloat = 30.0
            let rightInset = buttonWidth - imageWidth!  - textWidth - padding

            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightInset)
        }
}
