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
    @State var addItem = false
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            List
            {
                ForEach(0..<recordStore.records.count)
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
        .navigationBarTitle(recordStore.dateString)
        .navigationBarItems(trailing: Button("Add")
        {
            addItem.toggle()
        })
        .sheet(isPresented: $addItem)
        {
            Button(action:
            {
                var record = Record()
                record.CollectionDate = recordStore.date
                self.recordStore.records.append(record)
                addItem.toggle()
            }, label: {Text("Add")})
        }
    }
}

struct DayView_Previews: PreviewProvider
{
    @StateObject static var recordStore = RecordStore(records: [Record](), date: Date(), dateString: "10 March 2020")

    static var previews: some View
    {
        DayView(recordStore: recordStore)
    }
}
