//
//  MycoRecorderApp.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 15/04/2021.
//

import SwiftUI

@main
struct MycoRecorderApp: App
{
     @StateObject private var dataStore = DataStore().DoLoad()

    var body: some Scene
    {
        WindowGroup
        {
            ContentView(dataStore: dataStore)
        }
    }
}
