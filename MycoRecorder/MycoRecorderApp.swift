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
    @StateObject private var data = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(data.PopulateTestData())
        }
    }
}
