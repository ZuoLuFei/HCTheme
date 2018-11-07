/*******************************************************************************
 # File        : HCThemeNotification.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/24
 # Corporation : ####
 # Description : 通知
 ******************************************************************************/

import Foundation

struct HCThemeNotification {
    // 语言环境切换通知
    static let localizableDidChange = NSNotification.Name(rawValue: "com.zuolufei.HCTheme.localizableDidChange")
    
    // 主题更换通知
    static let themeDidChange = NSNotification.Name(rawValue: "com.zuolufei.HCTheme.themeDidChange")
    
}
