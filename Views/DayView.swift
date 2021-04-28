//
//  DayView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 19/04/2021.
//

import SwiftUI

struct DayView: View
{
    @ObservedObject var recordStore: RecordStore
    @State var showEditRecordView = false
    @State var record: Record = Record()
    
    var body: some View
    {
        if (!showEditRecordView)
        {
            VStack(alignment: .leading)
            {
                List
                {
                    ForEach(0..<recordStore.records.count, id: \.self)
                    {
                        i in
                        NavigationLink(destination: RecordView(record: $recordStore.records[i]))
                        {
                            HStack
                            {
                                Text(recordStore.records[i].Name)
                                Text(recordStore.records[i].Location)
                            }
                        }
                        .padding(0)
                    }
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitle(recordStore.dateString)
            .navigationBarItems(trailing: Button("Add")
            {
                record = Record()
                record.CollectionDate = recordStore.date
                showEditRecordView = true
            })
        }
        else
        {
            EditRecordView(
                actionOnOK:
                {
                    record.CollectionDate = recordStore.date
                    if (!recordStore.records.contains(record))
                    {
                        recordStore.records.append(record)
                    }
                    // Warning warning => clumsy
                    record = Record()
                    showEditRecordView.toggle()
                },
                actionOnCancel:
                {
                    showEditRecordView.toggle()
                },
                record: $record)
            .navigationBarHidden(true)
        }
    }
}

struct DayView_Previews: PreviewProvider
{
    static let model = DataStore().PopulateTestData()
    @StateObject static var recordStore: RecordStore = model.Collections[0]

    static var previews: some View
    {
        DayView(recordStore: recordStore)
    }
}
