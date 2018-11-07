# HCTheme
主题模式切换框架，支持控件Color及Image自动切换

使用前请先下载、运行并查看Demo。

## 【Demo演示】


![演示1](https://github.com/ZuoLuFei/DemoFigure/blob/master/HCTheme演示动图/HCTheme-1.gif)


/**********************************************************************/

## 【手动导入】

手动导入Theme文件夹，根据业务拓展HCTheme.swift / ThemeColor.plist / ThemeImage.plist 即可


/**********************************************************************/
## 方法说明

1. 在AppDelegate中初始化主题模式
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // 初始化主题模式
    HCThemeManager.share.configThemeType(.night)
    return true
}
```

2. 在业务中设置控件的颜色及颜色切换
```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = HCThemeCell.cellWithTableView(tableView: tableView)
    // 控件图片切换
    cell.titleImage.hc_Image = HCTheme.Image.App_Store
    // 控件背景色及字体颜色切换
    cell.titleLab.hc_TextColor = HCTheme.Color.keyWord
    cell.contentView.hc_BackgroundColor = HCTheme.Color.pageBg

    return cell
}
```

3. 切换主题
```swift
@objc func changeBtnClick() {
    let theme = HCThemeManager.share.current == HCTheme.night ? HCTheme.normal : HCTheme.night
    // 切换主题
    HCThemeManager.share.configThemeType(theme)
}
```

4. 根据业务拓展HCTheme.swift / ThemeColor.plist / ThemeImage.plist 文件

/**********************************************************************/

## 【示例】

请下载、运行并查看Demo

/**********************************************************************/

## 【贡献】

如果您发现了bug或需要帮助，请打开一个issue或者提交一个pull request，十分感谢


