/*******************************************************************************
 # File        : NSObject+ThemeDeinit.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/7/25
 # Corporation : ####
 # Description : 记录需要释放的通知主体
 ******************************************************************************/

import UIKit

extension NSObject {

    /// 记录需要释放的通知主体
    func addThemeDeinitBlock(_ deinitBlock:(() -> Void)?) -> Any? {

        guard let deinitBlock = deinitBlock else { return nil }

        let deinitBlockExecutor: HCThemeDeinitBlockExecutor = HCThemeDeinitBlockExecutor.executorWithDeinitBlock(deinitBlock)

        return deinitBlockExecutor
    }

}
