/*******************************************************************************
 # File        : UITextField+Theme.swift
 # Project     : HCTheme
 # Author      : 佐路飞
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var textColorKey = "textColorKey"

extension UITextField {
    /// textColor
    var hc_TextColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setTextColor:", dataKey: &textColorKey)

            self.textColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = valueFor(&textColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }
}
