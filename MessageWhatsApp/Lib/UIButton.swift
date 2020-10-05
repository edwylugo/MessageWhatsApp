//
//  UIButton.swift
//  MessageWhatsApp
//
//  Created by Edwy Lugo on 05/10/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import UIKit

extension UIButton {

static func iconLogo(named: String) -> UIButton {
    let button = UIButton()
    button.size(size: .init(width: 200, height: 200))
    button.setImage(UIImage(named: named), for: .normal)
    return button
}

static func customButton() -> UIButton {
    let button = UIButton()
    button.size(size: .init(width: 140, height: 60))
    button.backgroundColor = UIColor.init(hexString: "023933")
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    return button
}

}

