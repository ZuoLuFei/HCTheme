/*******************************************************************************
 # File        : HCThemeNotification.swift
 # Project     : HCTheme
 # Author      : 佐路飞
 # Created     : 2018/7/24
 # Corporation : ####
 # Description :
 ******************************************************************************/

import Foundation

struct HCThemeNotification {
    // 语言环境切换通知
    static let localizableDidChange = NSNotification.Name(rawValue: "com.zuolufei.HCTheme.kLocalizableManagerDidChangeLanguageSwitchNotification")
    
    // 主题更换通知
    static let themeDidChange = NSNotification.Name(rawValue: "com.zuolufei.HCTheme.themeDidChange")
    
}
