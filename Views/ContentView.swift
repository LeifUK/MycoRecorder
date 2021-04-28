//
//  ContentView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 15/04/2021.
//

import SwiftUI

struct ContentView: View
{
    @StateObject var dataStore: DataStore
    let dateFormatter = DateFormat()
    @State var showEditRecordView = false
    @State var record: Record = Record()

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
                .navigationBarHidden(false)
                .navigationBarTitle("Collections")
                .navigationBarItems(
                    leading:
                        HStack
                        {
                            Button("Filter"){}
                            Button("Settings"){}
                        },
                    trailing: Button("Add") { showEditRecordView = true })
            }
            else
            {
                EditRecordView(
                    actionOnOK:
                    {
                        let calendar = Calendar.current
                        var components = calendar.dateComponents(
                            [.year,.month,.day],
                            from: record.CollectionDate)
                        let year = components.year
                        let month = components.month
                        let day = components.day

                        var found = false
                        var index = 0
                        for i in 0..<dataStore.Collections.indices.count
                        {
                            components = calendar.dateComponents(
                                [.year,.month,.day],
                                from: dataStore.Collections[i].date)
                            if (
                                   (components.year == year) &&
                                   (components.month == month) &&
                                   (components.day == day)
                               )
                            {
                                found = true
                                 dataStore.Collections[i].records.append(record)
                                break
                            }
                            else
                            {
                                if (dataStore.Collections[i].date < record.CollectionDate)
                                {
                                    index = i + 1
                                }
                            }
                        }
                        if (!found)
                        {
                            let recordStore = RecordStore(
                                records: [Record](),
                                date: record.CollectionDate,
                                dateString: dateFormatter.FormatDateAsString(date: record.CollectionDate))
                            dataStore.Collections.insert(recordStore, at: index)
                            dataStore.Collections[index].records.append(record)
                        }
                        // Warning warning
                        record = Record()
                        showEditRecordView.toggle()
                    },
                    actionOnCancel:
                    {
                        showEditRecordView.toggle()
                    },
                    // Warning warning
                    record: $record)
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
