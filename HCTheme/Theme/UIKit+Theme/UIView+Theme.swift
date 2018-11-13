/*******************************************************************************
 # File        : UIView+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var backgroundColorKey = "backgroundColorKey"
private var tintColorKey = "tintColorKey"

extension UIView {
    /// backgroundColor
    var hc_BackgroundColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setBackgroundColor:", dataKey: &backgroundColorKey)

            self.backgroundColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&backgroundColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

    /// tintColor
    var hc_TintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setTintColor:", dataKey: &tintColorKey)

            self.tintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&tintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }
}
