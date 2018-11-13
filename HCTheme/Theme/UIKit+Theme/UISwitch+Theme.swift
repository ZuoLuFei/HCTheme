/*******************************************************************************
 # File        : UISwitch+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var onTintColorKey = "onTintColorKey"
private var thumbTintColorKey = "thumbTintColorKey"

extension UISwitch {
    /// onTintColor
    var hc_OnTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setOnTintColor:", dataKey: &onTintColorKey)

            self.onTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&onTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

    /// thumbTintColor
    var hc_ThumbTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setThumbTintColor:", dataKey: &thumbTintColorKey)

            self.thumbTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&thumbTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

}
