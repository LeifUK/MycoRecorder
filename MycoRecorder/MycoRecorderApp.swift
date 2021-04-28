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
    @State private var model = DataStore().PopulateTestData()

    var body: some Scene
    {
        WindowGroup
        {
            ContentView(collections: model.Collections)
        }
    }
}
