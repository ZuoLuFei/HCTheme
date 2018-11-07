/*******************************************************************************
 # File        : HCThemeDeinitBlockExecutor.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/25
 # Corporation : ####
 # Description : 主题切换方案注册通知实际释放操作类
 ******************************************************************************/

import UIKit

class HCThemeDeinitBlockExecutor: NSObject {

    var deinitBlock:(() -> Void)?

    /// 构造方法
    ///
    /// - Parameter deinitBlock: 接收更换主题模式的通知block
    /// - Returns: <#return value description#>
    class func executorWithDeinitBlock(_ deinitBlock:(() -> Void)?) -> HCThemeDeinitBlockExecutor {

        let deinitBlockExecutor: HCThemeDeinitBlockExecutor = HCThemeDeinitBlockExecutor()
        deinitBlockExecutor.deinitBlock = deinitBlock
        return deinitBlockExecutor

    }

    /// 执行析构方法，释放注册的通知
    deinit {
        if deinitBlock != nil {
            deinitBlock!()
            deinitBlock = nil
        }
    }

}
