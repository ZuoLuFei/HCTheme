/*******************************************************************************
 # File        : UIImageView+Theme.swift
 # Project     : HCTheme
 # Author      : 佐路飞
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
            guard let rawValue = valueFor(&imgKey) else { return nil }
            return HCTheme.Image(rawValue: rawValue)
        }
    }
}
