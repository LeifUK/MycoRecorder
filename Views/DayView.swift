//
//  DayView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 19/04/2021.
//

import SwiftUI

struct DayView: View
{
    var iSerialiser: ISerialiser
    @ObservedObject var recordStore: RecordStore
    @State var showEditRecordView = false
    @State var record: Record = Record()
    
    init(iSerialiser: ISerialiser, recordStore: RecordStore)
    {
        self.iSerialiser = iSerialiser
        self.recordStore = recordStore
    }
    
    func Delete(at offsets: IndexSet)
    {
        recordStore.records.remove(atOffsets: offsets)
    }

    var body: some View
    {
        VStack()
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
                            NavigationLink(destination: RecordView(
                                record: $recordStore.records[i],
                                readOnly: true,
                                onDisappear: { iSerialiser.Save() }))
                            {
                                HStack
                                {
                                    Text(recordStore.records[i].name + ", " +
                                        recordStore.records[i].location)
                                }
                            }
                            .padding(0)
                        }.onDelete(perform: Delete)
                    }
                }
                .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
                .navigationBarHidden(false)
                .navigationBarTitle(recordStore.dateString)
                .navigationBarItems(trailing: Button("Add")
                {
                    record = Record()
                    record.collectionDate = recordStore.date
                    showEditRecordView = true
                })
            }
            else
            {
                EditRecordView(
                    actionOnOK:
                    {
                        recordStore.records.append(record)
                        record = Record()
                        iSerialiser.Save()
                        showEditRecordView.toggle()
                    },
                    actionOnCancel:
                    {
                        showEditRecordView.toggle()
                    },
                    record: $record,
                    dateEditable: false)
                .navigationBarHidden(true)
            }
        }
    }
}

struct DayView_Previews: PreviewProvider
{
    static let model = DataStore().PopulateTestData()
    @StateObject static var recordStore: RecordStore = model.collections[0]

    static var previews: some View
    {
        DayView(iSerialiser: model, recordStore: recordStore)
    }
}
