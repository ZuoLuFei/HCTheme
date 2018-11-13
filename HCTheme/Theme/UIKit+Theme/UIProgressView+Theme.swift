/*******************************************************************************
 # File        : UIProgressView+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var progressTintColorKey = "progressTintColorKey"
private var trackTintColorKey = "trackTintColorKey"

extension UIProgressView {
    /// progressTintColor
    var hc_ProgressTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setProgressTintColor:", dataKey: &progressTintColorKey)

            self.progressTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&progressTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }

    }

    /// trackTintColor
    var hc_TrackTintColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setTrackTintColor:", dataKey: &trackTintColorKey)

            self.trackTintColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&trackTintColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }
}
