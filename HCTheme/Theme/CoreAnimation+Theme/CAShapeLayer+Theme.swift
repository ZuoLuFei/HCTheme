/*******************************************************************************
 # File        : CAShapeLayer+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/24
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var strokeColorKey = "strokeColorKey"
private var fillColorKey = "fillColorKey"

extension CAShapeLayer {

    /// strokeColor
    var hc_StrokeColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setStrokeColor:", dataKey: &strokeColorKey)

            self.strokeColor = HCThemeManager.share.colorOf(key: value).cgColor

        }

        get {
            guard let rawValue = theme_valueFor(&strokeColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

    /// fillColor
    var hc_FillColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setFillColor:", dataKey: &fillColorKey)

            self.fillColor = HCThemeManager.share.colorOf(key: value).cgColor
        }

        get {
            guard let rawValue = theme_valueFor(&fillColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }
    }

}

extension CAShapeLayer {

    /// 重写主题更新方法
    @objc override func themeUpdate() {

        pickers.forEach({ (key, value) in

            let valueStr = (value as? String) ?? ""
            let result = HCThemeManager.share.colorOf(key: valueStr).cgColor

            UIView.animate(withDuration: HCThemeModeAnimationDuration, animations: {

                if key == "setShadowColor:" {

                    self.shadowColor = result

                } else if key == "setBorderColor:" {

                    self.borderColor = result

                } else if key == "setBackgroundColor:" {

                    self.backgroundColor = result

                } else if key == "setStrokeColor:" {

                    self.strokeColor = result

                } else if key == "setFillColor:" {

                    self.fillColor = result

                }
            })
        })
    }
}
