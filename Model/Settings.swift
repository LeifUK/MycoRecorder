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
            return UserDefaults.standard.object(forKey: "DataFile") as? String ?? "MycoRecorder"
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "DataFile")
        }
    }
    
    static var defaultCollector: String
    {
        get
        {
            return UserDefaults.standard.object(forKey: "DefaultCollector") as? String ?? ""
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "DefaultCollector")
        }
    }
    
    private static func ReadBoolValue(key: String) -> Bool
    {
        return UserDefaults.standard.object(forKey: key) as? Bool ?? true
    }

    static var showIdentifier: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowIdentifier")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowIdentifier")
        }
    }
    
    static var showConfirmer: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowConfirmer")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowConfirmer")
        }
    }
    
    static var showViceCounty: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowViceCounty")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowViceCounty")
        }
    }
    
    static var showLatLong: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowLatLong")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowLatLong")
        }
    }
    
    static var showGridRef: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowGridRef")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowGridRef")
        }
    }

    static var showCap: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowCap")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowCap")
        }
    }

    static var showGills: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowGills")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowGills")
        }
    }

    static var showPores: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowPores")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowPores")
        }
    }

    static var showSpines: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowSpines")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowSpines")
        }
    }

    static var showHymenium: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowHymenium")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowHymenium")
        }
    }

    static var showStem: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowStem")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowStem")
        }
    }

    static var showFruitingBody: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowFruitingBody")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowFruitingBody")
        }
    }

    static var showMicroscopy: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowMicroscopy")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowMicroscopy")
        }
    }

    static var showSubstrate: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowSubstrate")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowSubstrate")
        }
    }

    static var showAssociatedOrganisms: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowAssociatedOrganisms")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowAssociatedOrganisms")
        }
    }

    static var showSmell: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowSmell")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowSmell")
        }
    }

    static var showTaste: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowTaste")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowTaste")
        }
    }

    static var showFlesh: Bool
    {
        get
        {
            return ReadBoolValue(key: "ShowFlesh")
        }
        set
        {
            UserDefaults.standard.set(newValue, forKey: "ShowFlesh")
        }
    }
}
