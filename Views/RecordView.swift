//
//  RecordView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 16/04/2021.
//

import SwiftUI

struct RecordView: View
{
    @Binding var record: Record
    @State var readOnly: Bool

    var body: some View
    {
        ScrollView(.vertical)
        {
            VStack
            {
                RecordDateItem(label: "Date", date: $record.collectionDate, readOnly: readOnly)
                RecordTextItem(label: "Name", text: $record.name)
                RecordTextItem(label: "Coordinates",text: $record.coordinates)
                RecordTextItem(label: "Location", text: $record.location)
                RecordTextItem(label: "Cap", text: $record.cap)
                RecordTextItem(label: "Gills", text: $record.gills)
                RecordTextItem(label: "Pores", text: $record.pores)
                RecordTextItem(label: "Stem", text: $record.stem)
                RecordTextItem(label: "Smell", text: $record.smell)
                RecordTextItem(label: "Taste", text: $record.taste)
            }
        }
        .navigationBarTitle(" ", displayMode: .inline)
        .padding(4)
        .background(Color(red: 0.8, green: 0.8, blue: 0.8))
        .navigationBarItems(trailing: Button("Delete"){})
    }
}

struct RecordView_Previews: PreviewProvider
{
    @State static var record = Record()
    static var previews: some View
    {
        RecordView(record: $record, readOnly: false)
    }
}
