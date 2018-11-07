/*******************************************************************************
 # File        : HCTheme.swift
 # Project     : HCTheme
 # Author      : 佐路飞
 # Created     : 2018/7/23
 # Corporation : ####
 # Description : 主题颜色枚举类
 -------------------------------------------------------------------------------
 ******************************************************************************/

import Foundation

//class HCTheme: NSObject {
//    static let normal = "Normal" // 普通模式
//    static let night = "Night"   // 夜间模式
//    
//    class Color: NSObject {
//        static let main = "main" // 主色
//    }
//    
//}


enum HCTheme: String {
    case normal = "Normal" // 普通模式
    case night = "Night"   // 夜间模式

    enum Color: String {
        case main             // 主色
//        case assistOne        // 辅助色1
//        case assistTwo        // 辅助色2
//        case assistThree      // 辅助色3
//        case keyWord          // 重点文字
//        case keyWordTwo       // 重点文字2
//        case contentWord      // 内容文字
//        case tipWord          // 提示文字
//        case tipWord60        // 提示文字颜色 60%透明度
//        case tipWordTwo       // 提示文字2
//        case alertBg          // 弹出层背景
//        case pageBg           // 页面底层背景
//        case moduleBg         // 模块背景底色
//        case splitLine        // 分割线
//        case navigationTitle  // 导航栏标题颜色
//        case alertTips        // 警告提示语
//        case lightBlue        //
    }

    enum Image: String {
        case alphaTranslucence = "Common_alpha_translucence"    // 半透明色图
//        case searchBg = "Common_search_bg"    // 搜索框背景
//        case qrIcon = "Common_QR_Icon"    // 二维码图片
//        case tableViewCellBg2 = "Common_tableViewCell_bg2"    // 提现充值背景图片
//        case selectDown = "Common_icon_select_down"    // 向下箭头图片
//        case selectUpward = "Common_icon_select_upward"    // 向上箭头图片
    }
}
