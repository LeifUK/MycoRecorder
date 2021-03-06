//
//  ContentView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 15/04/2021.
//

import SwiftUI

enum CurrentView
{
    case Settings, AddRecord, Data
}

struct ContentView: View
{
    @State var record = Record()
    @StateObject var dataStore: DataStore
    @State var showEditRecordView = false
    @State var currentView = CurrentView.Data
    @State var dataFile = "MycoRecorder"
    
    var body: some View
    {
        NavigationView
        {
            if (currentView == CurrentView.Data)
            {
                VStack
                {
                    List
                    {
                        ForEach(0..<dataStore.collections.count)
                        {
                            i in
                            NavigationLink(
                                destination: DayView(
                                    iSerialiser: dataStore,
                                    recordStore: dataStore.collections[i]))
                            {
                                Text(dataStore.collections[i].dateString)
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
                .navigationBarHidden(false)
                .navigationBarTitle("Collections")
                .navigationBarItems(
                    leading:  Button("Settings")
                    {
                        currentView = CurrentView.Settings
                    },
                    trailing:
                        AddRecordButton(
                            record: $record,
                            date: Date(),
                            onClick:
                                {
                                    currentView = CurrentView.AddRecord
                                }))
            }
            else if (currentView == CurrentView.AddRecord)
            {
                EditRecordView(
                    actionOnOK:
                    {
                        dataStore.AddRecord(record: record)
                        dataStore.Save()
                        currentView = CurrentView.Data
                    },
                    actionOnCancel:
                    {
                        currentView = CurrentView.Data
                    },
                    record: $record,
                    dateEditable: true)
                    .onAppear()
                    {
                        record = Record()
                    }
                    .navigationBarHidden(true)
            }
            else
            {
                SettingsView(
                    actionOnOK:
                    {
                        dataStore.Load()
                        currentView = CurrentView.Data
                    },
                    actionOnCancel:
                    {
                        currentView = CurrentView.Data
                    })
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    @State static var dataStore = DataStore().PopulateTestData()
    static var previews: some View
    {
        ContentView(dataStore: dataStore)
    }
}
