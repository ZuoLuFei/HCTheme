/*******************************************************************************
 # File        : UITabBarItem+Theme.swift
 # Project     : KuCoin
 # Author      : ZuoLuFei
 # Created     : 2018/8/29
 # Corporation : ####
 # Description :
 <#Description Logs#>
 ******************************************************************************/

import UIKit

private var imageKey = "imageKey"
private var selectedImageKey = "selectedImageKey"

extension UITabBarItem {

    /// image
    var hc_Image: HCTheme.Image? {
        set {
            guard let value = newValue?.rawValue else { return }
            register(value, methodKey: "setImage:", dataKey: &imageKey)

            self.image = HCThemeManager.share.imageOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&imageKey) else { return nil }
            return HCTheme.Image(rawValue: rawValue)
        }
    }

    /// selectedImage
    var hc_SelectedImage: HCTheme.Image? {
        set {
            guard let value = newValue?.rawValue else { return }
            register(value, methodKey: "setSelectedImage:", dataKey: &selectedImageKey)

            self.selectedImage = HCThemeManager.share.imageOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&selectedImageKey) else { return nil }
            return HCTheme.Image(rawValue: rawValue)
        }
    }

}
