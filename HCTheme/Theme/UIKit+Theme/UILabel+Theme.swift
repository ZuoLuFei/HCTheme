//
//  UILabel+Theme.swift
//  HCTheme
//
//  Created by 佐路飞 on 2018/7/20.
//  Copyright © 2018年 Kucoin. All rights reserved.
//

import Foundation
import UIKit

private var textColorKey = "textColorKey"
private var shadowColorKey = "shadowColorKey"
private var highlightedTextColorKey = "highlightedTextColorKey"

extension UILabel {

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

    /// shadowColor
    var hc_ShadowColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setShadowColor:", dataKey: &shadowColorKey)

            self.shadowColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = valueFor(&shadowColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

    /// highlightedTextColor
    var hc_HighlightedTextColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setHighlightedTextColor:", dataKey: &highlightedTextColorKey)

            self.highlightedTextColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = valueFor(&highlightedTextColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

}
