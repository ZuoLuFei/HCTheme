/*******************************************************************************
 # File        : UITextView+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var textColorKey = "textColorKey"

extension UITextView {
    /// textColor
    var hc_TextColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setTextColor:", dataKey: &textColorKey)

            self.textColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&textColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }
}
