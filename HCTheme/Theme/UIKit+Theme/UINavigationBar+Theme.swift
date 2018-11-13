//
//  UINavigationBar+Theme.swift
//  HCTheme
//
//  Created by ZuoLuFei on 2018/7/23.
//  Copyright © 2018年 Kucoin. All rights reserved.
//

import UIKit

private var barTintColorKey = "barTintColorKey"

extension UINavigationBar {
    /// barTintColor
    var hc_BarTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setBarTintColor:", dataKey: &barTintColorKey)

            self.barTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&barTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }
}
