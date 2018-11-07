/*******************************************************************************
 # File        : UISlider+Theme.swift
 # Project     : HCTheme
 # Author      : 佐路飞
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
            guard let rawValue = valueFor(&minimumTrackTintColorKey) else { return nil }
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
            guard let rawValue = valueFor(&maximumTrackTintColorKey) else { return nil }
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
            guard let rawValue = valueFor(&thumbTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }
}
