//
//  LocalStorage.swift
//  iddog
//
//  Created by Lidia Chou on 10/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Foundation

public class LocalStorage {
    
    let defaults = UserDefaults.standard
    
    public func saveUserDefaultValue(_ value: String, key: String) {
        defaults.set(value, forKey: key)
    }
    
    public func getUserDefaultValue(key: String) -> Any? {
        if let value = defaults.string(forKey: key) {
            return value
        }
        return nil
    }
}
