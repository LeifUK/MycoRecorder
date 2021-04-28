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

    var body: some View
    {
        ScrollView(.vertical)
        {
            VStack
            {
                RecordDateItem(label: "Date", date: $record.CollectionDate)
                RecordTextItem(label: "Name", text: $record.Name)
                RecordTextItem(label: "Coordinates",text: $record.Coordinates)
                RecordTextItem(label: "Location", text: $record.Location)
                RecordTextItem(label: "Cap", text: $record.Cap)
                RecordTextItem(label: "Gills", text: $record.Gills)
                RecordTextItem(label: "Pores", text: $record.Pores)
                RecordTextItem(label: "Stem", text: $record.Stem)
                RecordTextItem(label: "Smell", text: $record.Smell)
                RecordTextItem(label: "Taste", text: $record.Taste)
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
        RecordView(record: $record)
    }
}
