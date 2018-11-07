/*******************************************************************************
 # File        : UIButton+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var backgroundColorKey = "backgroundColorKey"

extension UIButton {

    /// 设置titleColor
    ///
    /// - Parameters:
    ///   - theme: 主题色
    ///   - state: 状态
    func hc_setTitleColorPicker(_ theme: HCTheme.Color, forState state: UIControlState) {

        self.setTitleColor(HCThemeManager.share.colorOf(key: theme.rawValue), for: state)

        var pik = pickers

        var dict: [String: Any] = (pik[String("\(state.rawValue)")] as? [String: Any]) ?? [String: Any]()
        dict.updateValue(theme.rawValue, forKey: "setTitleColor:forState:")
        pik.updateValue(dict, forKey: String("\(state.rawValue)"))

        objc_setAssociatedObject(self, &themePickerKey, pik, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    }

    /// 设置backgroundImage
    ///
    /// - Parameters:
    ///   - theme: 图片
    ///   - state: 状态
    func hc_setBackgroundImage(_ theme: HCTheme.Image, forState state: UIControlState) {
        self.setBackgroundImage(HCThemeManager.share.imageOf(key: theme.rawValue), for: state)

        var pik = pickers

        var dict: [String: Any] = (pik[String("\(state.rawValue)")] as? [String: Any]) ?? [String: Any]()
        dict.updateValue(theme.rawValue, forKey: "setBackgroundImage:forState:")
        pik.updateValue(dict, forKey: String("\(state.rawValue)"))

        objc_setAssociatedObject(self, &themePickerKey, pik, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    }

    /// 设置Image
    ///
    /// - Parameters:
    ///   - theme: 图片
    ///   - state: 状态
    func hc_setImage(_ theme: HCTheme.Image, forState state: UIControlState) {

        self.setImage(HCThemeManager.share.imageOf(key: theme.rawValue), for: state)

        var pik = pickers

        var dict: [String: Any] = (pik[String("\(state.rawValue)")] as? [String: Any]) ?? [String: Any]()
        dict.updateValue(theme.rawValue, forKey: "setImage:forState:")
        pik.updateValue(dict, forKey: String("\(state.rawValue)"))

        objc_setAssociatedObject(self, &themePickerKey, pik, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    }
}

extension UIButton {

    /// 重写主题更新方法
    @objc override func themeUpdate() {

        self.pickers.forEach({ (key, value) in

            if let dict = value as? [String: Any] {

                dict.forEach({(stateKey, selectorValue) in

                    let state: UIControlState = UIControlState(rawValue: UIControlState.RawValue(key)!)
                    let selectorStr = (selectorValue as? String) ?? ""

                    UIView.animate(withDuration: HCThemeModeAnimationDuration, animations: {

                        if stateKey == "setTitleColor:forState:" {
                            self.setTitleColor(HCThemeManager.share.colorOf(key: selectorStr), for: state)
                        } else if stateKey == "setBackgroundImage:forState:" {
                            self.setBackgroundImage(HCThemeManager.share.imageOf(key: selectorStr), for: state)
                        } else if stateKey == "setImage:forState:" {
                            self.setImage(HCThemeManager.share.imageOf(key: selectorStr), for: state)
                        }
                    })
                })
            } else {
                let sel: Selector = Selector(key)
                let valueStr = (value as? String) ?? ""
                let result = HCThemeManager.share.colorOf(key: valueStr)

                UIView.animate(withDuration: HCThemeModeAnimationDuration, animations: {
                    self.perform(sel, with: result)
                })
            }
        })

    }

}
