//
//  ContentView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 15/04/2021.
//

import SwiftUI

struct ContentView: View
{
    @State var record = Record()
    @StateObject var dataStore: DataStore
    @State var showEditRecordView = false
    
    var body: some View
    {
        NavigationView
        {
            if (!showEditRecordView)
            {
                VStack
                {
                    List
                    {
                        ForEach(0..<dataStore.Collections.count)
                        {
                            i in
                            NavigationLink(destination: DayView(
                                            recordStore: dataStore.Collections[i]))
                            {
                                Text(dataStore.Collections[i].dateString)
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
                .navigationBarHidden(false)
                .navigationBarTitle("Collections")
                .navigationBarItems(
                    leading:  Button("Settings"){},
                    trailing: Button("Add") { showEditRecordView = true })
            }
            else
            {
                EditRecordView(
                    actionOnOK:
                    {
                        dataStore.AddRecord(record: record)
                        record = Record()
                        showEditRecordView.toggle()
                    },
                    actionOnCancel:
                    {
                        showEditRecordView.toggle()
                    },
                    record: $record,
                    dateEditable: true)
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
