/*******************************************************************************
 # File        : UIColor+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/11/7
 # Corporation : ####
 # Description : <#Description Logs#>
 ******************************************************************************/

import UIKit

extension UIColor {
    static func hc_rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    static func hc_hex(value: UInt32, alpha: CGFloat = 1) -> UIColor {
        let r = CGFloat((value & 0xff0000) >> 16)
        let g = CGFloat((value & 0x00ff00) >> 8)
        let b = CGFloat(value & 0x0000ff)
        return UIColor.hc_rgb(r: r, g: g, b: b, a: alpha)
    }
    
    static func hc_hexString(value: String) -> UIColor {
        guard let hexValue = Int(value, radix: 16) else { return UIColor.clear }
        
        var red = 0.0
        var green = 0.0
        var blue = 0.0
        var alpha = 255.0
        
        if value.count == 6 {
            red = Double((hexValue >> 16) & 0xff)
            green = Double((hexValue >> 8) & 0xff)
            blue = Double(hexValue & 0xff)
        } else if value.count == 8 {
            red = Double((hexValue >> 24) & 0xff)
            green = Double((hexValue >> 16) & 0xff)
            blue = Double((hexValue >> 8) & 0xff)
            alpha = Double(hexValue & 0xff)
        }
        
        return UIColor.hc_rgb(r: CGFloat(red), g: CGFloat(green), b: CGFloat(blue), a: CGFloat(alpha / 255.0))
    }
}
