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
                RecordItemView(label: "Name", text: $record.Name)
                RecordItemView(label: "Coordinates",text: $record.Coordinates)
                RecordItemView(label: "Location", text: $record.Location)
                RecordItemView(label: "Cap", text: $record.Cap)
                RecordItemView(label: "Gills", text: $record.Gills)
                RecordItemView(label: "Pores", text: $record.Pores)
                RecordItemView(label: "Stem", text: $record.Stem)
                RecordItemView(label: "Smell", text: $record.Smell)
                RecordItemView(label: "Taste", text: $record.Taste)
                Spacer()
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
