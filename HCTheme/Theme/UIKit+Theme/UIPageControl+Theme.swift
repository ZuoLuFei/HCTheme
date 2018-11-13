/*******************************************************************************
 # File        : UIPageControl+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var pageIndicatorTintColorKey = "pageIndicatorTintColorKey"
private var currentPageIndicatorTintColorKey = "currentPageIndicatorTintColorKey"

extension UIPageControl {
    /// pageIndicatorTintColor
    var hc_PageIndicatorTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setPageIndicatorTintColor:", dataKey: &pageIndicatorTintColorKey)

            self.pageIndicatorTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&pageIndicatorTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

    /// currentPageIndicatorTintColor
    var hc_CurrentPageIndicatorTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setCurrentPageIndicatorTintColor:", dataKey: &currentPageIndicatorTintColorKey)

            self.currentPageIndicatorTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&currentPageIndicatorTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }
}
