//
//  UIView.swift
//  MessageWhatsApp
//
//  Created by Edwy Lugo on 05/10/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

extension UIView {
    
    func preencher (top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
      translatesAutoresizingMaskIntoConstraints = false
      
      if let top = top {
        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
      }
      
      if let leading = leading {
        leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
      }
      
      if let trailing = trailing {
        trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
      }
      
      if let bottom = bottom {
        bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
      }
      
      if size.width != 0 {
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
      }
      
      if size.height != 0 {
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
      }
    }
    
    func size (size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != 0 {
          widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
          heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
