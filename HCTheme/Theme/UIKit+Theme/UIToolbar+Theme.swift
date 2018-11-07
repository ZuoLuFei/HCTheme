/*******************************************************************************
 # File        : UIToolbar+Theme.swift
 # Project     : HCTheme
 # Author      : 佐路飞
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var barTintColorKey = "barTintColorKey"

extension UIToolbar {
    /// barTintColor
    var hc_BarTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setBarTintColor:", dataKey: &barTintColorKey)

            self.barTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = valueFor(&barTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }
}
