/*******************************************************************************
 # File        : UITableView+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description :
 ******************************************************************************/

import UIKit

private var separatorColorKey = "separatorColorKey"
private var sectionIndexColorKey = "sectionIndexColorKey"
private var sectionIndexBgColorKey = "sectionIndexBgColorKey"
private var sectionIndexTrackingBgColorKey = "sectionIndexTrackingBgColorKey"

extension UITableView {

    /// separatorColor
    var hc_SeparatorColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setSeparatorColor:", dataKey: &separatorColorKey)

            self.separatorColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&separatorColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }

    }

    /// sectionIndexColor
    var hc_SectionIndexColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setSectionIndexColor:", dataKey: &sectionIndexColorKey)

            self.sectionIndexColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&sectionIndexColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }

    }

    /// sectionIndexBackgroundColor
    var hc_SectionIndexBackgroundColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setSectionIndexBackgroundColor:", dataKey: &sectionIndexBgColorKey)

            self.sectionIndexBackgroundColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&sectionIndexBgColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }

    }

    /// sectionIndexTrackingBackgroundColor
    var hc_SectionIndexTrackingBgColor: HCTheme.Color? {
        set {
            guard let value = newValue?.rawValue else { return }

            register(value, methodKey: "setSectionIndexTrackingBackgroundColor:", dataKey: &sectionIndexTrackingBgColorKey)

            self.sectionIndexTrackingBackgroundColor = HCThemeManager.share.colorOf(key: value)
        }

        get {
            guard let rawValue = theme_valueFor(&sectionIndexTrackingBgColorKey) else { return nil }
            return HCTheme.Color(rawValue: rawValue)
        }

    }

}
