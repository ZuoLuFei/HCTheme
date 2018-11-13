/*******************************************************************************
 # File        : UIImageView+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/24
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var imgKey = "imgKey"

extension UIImageView {

    /// 设置Image
    ///
    /// - Parameters:
    ///   - theme: 图片
    ///   - state: 状态
    func hc_InitWithImagePicker(_ theme: HCTheme.Image) -> UIImageView {
        let imageView = UIImageView(image: HCThemeManager.share.imageOf(key: theme.rawValue))
        imageView.hc_Image = theme
        return imageView
    }

    /// image
    var hc_Image: HCTheme.Image? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setImage:", dataKey: &imgKey)

            self.image = HCThemeManager.share.imageOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&imgKey) else { return nil }
            return HCTheme.Image(rawValue: rawValue)
        }
    }
    
}

extension UIImageView {
    // 主题更新通知方法
    @objc override func themeUpdate() {
        pickers.forEach({ (selectorKey, themeColor) in
            let sel: Selector = Selector(selectorKey)
            let key = (themeColor as? String) ?? ""
            let result = HCThemeManager.share.imageOf(key: key)
            
            UIView.animate(withDuration: HCThemeModeAnimationDuration, animations: {
                
                self.perform(sel, with: result)
                
            })
        })
    }
}
