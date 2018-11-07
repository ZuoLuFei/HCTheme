/*******************************************************************************
 # File        : HCThemeManager.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/19
 # Corporation : ####
 # Description : 主题切换管理类
 ******************************************************************************/

import UIKit

// 主题切换动画时间
let HCThemeModeAnimationDuration = 0.3

// MARK: - 初始化
class HCThemeManager: NSObject {
    // 主题偏好设置存储
    static let themeKey = "com.zuolufei.HCTheme.HCThemeManager.themeKey"

    // 当前主题
    public var current: HCTheme = .night

    /**
     * 颜色模型数据
     * key: 主题key
     * value: 颜色字典
     */
    private var colors: [String: Any] = [:]

    /**
     * 图片模型数据
     * key: 主题key
     * value: 图片字典
     */
    private var images: [String: Any] = [:]

    // 初始化方法
    override init() {
        // 初始化主题模式
        if let value = UserDefaults.hc_objectForKey(HCThemeManager.themeKey) as? String,
            let theme = HCTheme(rawValue: value) {
            current = theme
        }

        // 初始化主题数据模型
        if let path = Bundle.main.path(forResource: "ThemeColor", ofType: "plist"),
            let colors = NSDictionary(contentsOfFile: path) as? [String: Any] {
            self.colors = colors
        }

        if let path = Bundle.main.path(forResource: "ThemeImage", ofType: "plist"),
            let images = NSDictionary(contentsOfFile: path) as? [String: Any] {
            self.images = images
        }
    }

}

// MARK: - 公共方法
extension HCThemeManager {

    /// 单例
    static let share = HCThemeManager()

    /// 配置主题
    ///
    /// - Parameter themeType: 主题
    func configThemeType(_ type: HCTheme) {
        current = type

        // 存储当前主题
        UserDefaults.hc_setAndSaveObject(current.rawValue, key: HCThemeManager.themeKey)

        // 发出通知
        NotificationCenter.default.post(name: HCThemeNotification.themeDidChange, object: nil)
    }

    /// 获取颜色
    func colorOf(key: String) -> UIColor {

        if let colorStr = (colors[current.rawValue] as? [String: String])?[key] {
            return UIColor.hc_hexString(value: colorStr)
        }

        return UIColor.black
    }

    /// 获取图片
    func imageOf(key: String) -> UIImage {
        
        if let imageStr = (images[current.rawValue] as? [String: String])?[key],
            let img = UIImage(named: imageStr) {
            return img
        }

        return UIImage(color: UIColor.black, size: CGSize(width: 10, height: 10))
    }
}
