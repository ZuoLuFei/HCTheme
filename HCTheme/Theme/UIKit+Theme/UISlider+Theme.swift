/*******************************************************************************
 # File        : UISlider+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var minimumTrackTintColorKey = "minimumTrackTintColorKey"
private var maximumTrackTintColorKey = "maximumTrackTintColorKey"
private var thumbTintColorKey = "thumbTintColorKey"

extension UISlider {
    /// minimumTrackTintColor
    var hc_MinimumTrackTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setMinimumTrackTintColor:", dataKey: &minimumTrackTintColorKey)

            self.minimumTrackTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&minimumTrackTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }

    }

    /// maximumTrackTintColor
    var hc_MaximumTrackTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setMaximumTrackTintColor:", dataKey: &maximumTrackTintColorKey)

            self.maximumTrackTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&maximumTrackTintColorKey) else { return nil }
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
