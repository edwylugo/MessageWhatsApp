//
//  UIImageView.swift
//  MessageWhatsApp
//
//  Created by Edwy Lugo on 05/10/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

extension UIImageView {
    
    static func customImageView(named: String) -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.size(size: .init(width: 200, height: 200))
        image.image = UIImage(named: named)
        return image
    }
    
}
