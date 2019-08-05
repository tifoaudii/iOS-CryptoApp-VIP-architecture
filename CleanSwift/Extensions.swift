//
//  Extensions.swift
//  CleanSwift
//
//  Created by Ilham Hadi Prabawa on 7/30/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop:CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight:CGFloat, width: CGFloat, height: CGFloat) -> [NSLayoutConstraint] {
        
        var anchors = [NSLayoutConstraint]()
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: paddingTop))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom))
        }
        
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -paddingRight))
        }
        
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: paddingLeft))
        }
        
        if width != 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: width))
        }
        
        if height != 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: height))
        }
        
        anchors.forEach{ $0.isActive = true }
        
        return anchors
        
    }
}

