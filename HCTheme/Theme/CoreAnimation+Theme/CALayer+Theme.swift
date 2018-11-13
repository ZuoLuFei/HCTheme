/*******************************************************************************
 # File        : CALayer+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/24
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var shadowColorKey = "shadowColorKey"
private var borderColorKey = "borderColorKey"
private var backgroundColorKey = "backgroundColorKey"

extension CALayer {

    /// shadowColor
    var hc_ShadowColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setShadowColor:", dataKey: &shadowColorKey)

            self.shadowColor = HCThemeManager.share.colorOf(key: value).cgColor
        }

        get {
            guard let rawValue = theme_valueFor(&shadowColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

    /// borderColor
    var hc_BorderColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setBorderColor:", dataKey: &borderColorKey)

            self.borderColor = HCThemeManager.share.colorOf(key: value).cgColor

        }

        get {
            guard let rawValue = theme_valueFor(&borderColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

    /// backgroundColor
    var hc_BackgroundColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setBackgroundColor:", dataKey: &backgroundColorKey)

            self.backgroundColor = HCThemeManager.share.colorOf(key: value).cgColor
        }

        get {
            guard let rawValue = theme_valueFor(&backgroundColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

}

extension CALayer {

    /// 重写主题更新方法
    @objc override func themeUpdate() {

        pickers.forEach({ (key, value) in

            let pickerKey = (value as? String) ?? ""
            let result = HCThemeManager.share.colorOf(key: pickerKey).cgColor

            UIView.animate(withDuration: HCThemeModeAnimationDuration, animations: {

                if key == "setShadowColor:" {

                    self.shadowColor = result

                } else if key == "setBorderColor:" {

                    self.borderColor = result

                } else if key == "setBackgroundColor:" {

                    self.backgroundColor = result

                }

            })

        })

    }

}
