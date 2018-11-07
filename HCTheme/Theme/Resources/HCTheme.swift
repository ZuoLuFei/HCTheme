/*******************************************************************************
 # File        : HCTheme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/23
 # Corporation : ####
 # Description : 主题颜色枚举类
 ******************************************************************************/

import Foundation

enum HCTheme: String {
    case normal = "Normal" // 普通模式
    case night = "Night"   // 夜间模式

    enum Color: String {
        case main             // 主色
        case keyWord          // 重点文字
        case tipWord          // 提示文字
        case tipWord60        // 提示文字颜色 60%透明度
        case pageBg           // 页面底层背景
        case moduleBg         // 模块背景底色
        case navigationTitle  // 导航栏标题颜色
    }

    enum Image: String {
        case App_Store = "App_Store"    // 半透明色图
    }
}
