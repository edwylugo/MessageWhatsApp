//
//  UIColor.swift
//  MessageWhatsApp
//
//  Created by Edwy Lugo on 04/10/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /*............................................................................*/
    // MARK: - Extension Functions
    /*............................................................................*/

    /// UIColor utilizando informações RGB
    ///
    /// - Parameters:
    ///   - r: Red
    ///   - g: Green
    ///   - b: Blue
    convenience init(r : Int, g : Int, b : Int) {
        
        let factor = CGFloat(255.0)
        let _r = CGFloat(r)/factor
        let _g = CGFloat(g)/factor
        let _b = CGFloat(b)/factor
        self.init(red: _r, green: _g, blue: _b, alpha: 1.0)
        
    }
    
    /*............................................................................*/
    
    /// UIColor utilizando um hex color
    ///
    /// - Parameter hexString: String do Hex
    convenience init (hexString : String) {
        
        var int32Hex : UInt64 = 0
        let scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet.init(charactersIn: "#")
        scanner.scanHexInt64(&int32Hex)
        
        let intHex = Int(int32Hex)
        let _hexR = (intHex & 0xFF0000 ) >> 16
        let _hexG = (intHex & 0x00FF00 ) >> 8
        let _hexB = (intHex & 0x0000FF )
        
        self.init(r: _hexR, g: _hexG, b: _hexB)
    }
    
    /*............................................................................*/
}
