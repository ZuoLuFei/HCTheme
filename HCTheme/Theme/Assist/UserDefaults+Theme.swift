/*******************************************************************************
 # File        : UserDefaults+Theme.swift
 # Project     : HCTheme
 # Author      : ZuoLuFei
 # Created     : 2018/11/7
 # Corporation : ####
 # Description : <#Description Logs#>
 ******************************************************************************/

import UIKit

extension UserDefaults {
    static func hc_objectForKey(_ key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    static func hc_setAndSaveObject(_ value: Any, key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func hc_removeObjectForKey(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
