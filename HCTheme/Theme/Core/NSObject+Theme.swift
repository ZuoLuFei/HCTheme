/*******************************************************************************
 # File        : NSObject+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/25
 # Corporation : ####
 # Description : 主题切换核心类
 ******************************************************************************/

import Foundation
import UIKit

var themePickerKey = "themePickerKey"
private var kThemeDeinitBlocks = "kThemeDeinitBlocks"

extension NSObject {
    // 属性字典
    var pickers: [String: Any] {
        if let pickers = objc_getAssociatedObject(self, &themePickerKey) as? [String: Any] {
            return pickers
        } else {
            let pickers = [String: Any]()

            // 释放通知
            if objc_getAssociatedObject(self, &kThemeDeinitBlocks) == nil {

                let deinitHelper = self.addThemeDeinitBlock { [weak self] in
                    NotificationCenter.default.removeObserver(self as Any)
                }

                objc_setAssociatedObject(self, &kThemeDeinitBlocks, deinitHelper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }

            NotificationCenter.default.removeObserver(self, name: HCThemeNotification.themeDidChange, object: nil)

            NotificationCenter.default.addObserver(self, selector: #selector(themeUpdate), name: HCThemeNotification.themeDidChange, object: nil)

            objc_setAssociatedObject(self, &themePickerKey, pickers, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            return pickers
        }
    }

    // 主题更新通知方法
    @objc func themeUpdate() {
        pickers.forEach({ (selectorKey, themeColor) in
            let sel: Selector = Selector(selectorKey)
            let key = (themeColor as? String) ?? ""
            let result = HCThemeManager.share.colorOf(key: key)

            UIView.animate(withDuration: HCThemeModeAnimationDuration, animations: {

                self.perform(sel, with: result)

            })
        })
    }

    /**
     * 注册属性变化
     */
    func register(_ value: String, methodKey: String, dataKey: UnsafeRawPointer) {
        objc_setAssociatedObject(self, dataKey, value, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)

        var pik = pickers
        pik.updateValue(value, forKey: methodKey)

        objc_setAssociatedObject(self, &themePickerKey, pik, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    /**
     *
     */
    func theme_valueFor(_ dataKey: UnsafeRawPointer) -> String? {
        return objc_getAssociatedObject(self, dataKey) as? String
    }

}
