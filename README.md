# CMKit
一个包含很多分类和工具类的快速集成项目。

使用前请先下载、运行并查看Demo。

## 【Demo演示】


![演示1](https://github.com/ZuoLuFei/DemoFigure/blob/master/CMKit%E6%BC%94%E7%A4%BA%E5%8A%A8%E5%9B%BE/CMKit-1.gif)


/**********************************************************************/

## 【手动导入】

手动导入Theme文件夹，根据业务拓展HCTheme.swift / ThemeColor.plist / ThemeImage.plist 即可


/**********************************************************************/
## 方法说明

1. 在AppDelegate中初始化主题模式
```bash
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // 初始化主题模式
    HCThemeManager.share.configThemeType(.night)
    return true
}
```

/**********************************************************************/

## 【示例】

请下载、运行并查看Demo




