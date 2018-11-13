//
//  UIBarButtonItem+Theme.swift
//  HCTheme
//
//  Created by ZuoLuFei on 2018/7/23.
//  Copyright © 2018年 Kucoin. All rights reserved.
//

import UIKit

private var tintColorKey = "tintColorKey"

extension UIBarButtonItem {
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
