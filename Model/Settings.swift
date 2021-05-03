//
//  Settings.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 03/05/2021.
//

import Foundation

final class Settings
{
    static var dataFile: String
    {
        get
        {
            return UserDefaults.standard.object(forKey: "Data File") as? String ?? "MycoRecorder"
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "Data File")
        }
    }
    
    static var defaultCollector: String
    {
        get
        {
            return UserDefaults.standard.object(forKey: "Default Collector") as? String ?? ""
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "Default Collector")
        }
    }
}
