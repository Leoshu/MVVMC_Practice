//
//  CacheManager.swift
//  CoreLib
//
//  Created by Sabrina on 2018/2/5.
//  Copyright © 2018年 Gemtek Technology Co., Ltd. All rights reserved.
//

import UIKit

let KEY_USER_NAME:String = "userName"

public class CacheManager: NSObject {
    
    // MARK: save / load Bool
    public class func save<T>(value: T, key: String) {
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public class func loadBool(key: String) -> Bool {
        let defaults:UserDefaults = UserDefaults.standard
        return defaults.bool(forKey: key)
    }
    
    public class func loadString(key: String) -> String? {
        let defaults:UserDefaults = UserDefaults.standard
        return defaults.string(forKey: key)
    }
    
    public class func remove(key: String) {
        let defaults:UserDefaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
    }
}
