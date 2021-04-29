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
    var readOnly: Bool
    var onDisappear: () -> Void
    
    init(record: Binding<Record>, readOnly: Bool, onDisappear: @escaping () -> Void)
    {
        self._record = record
        self.readOnly = readOnly
        self.onDisappear = onDisappear
    }

    var body: some View
    {
        ScrollView(.vertical)
        {
            VStack
            {
                Group
                {
                    RecordDateItem(label: "Date", date: $record.collectionDate, readOnly: readOnly)
                    RecordTextItem(label: "Name", text: $record.name)
                    RecordTextItem(label: "Collector", text: $record.collector)
                    RecordTextItem(label: "Identifier", text: $record.identifier)
                    RecordTextItem(label: "Confirmer", text: $record.confirmer)
                    RecordTextItem(label: "Coordinates",text: $record.coordinates)
                    RecordTextItem(label: "Location", text: $record.location)
                    RecordTextItem(label: "Cap", text: $record.cap)
                    RecordTextItem(label: "Gills", text: $record.gills)
                    RecordTextItem(label: "Pores", text: $record.pores)
                }
                Group
                {
                    RecordTextItem(label: "Spines", text: $record.spines)
                    RecordTextItem(label: "FruitingBody", text: $record.fruitingBody)
                    RecordTextItem(label: "Substrate", text: $record.substrate)
                    RecordTextItem(label: "Associations", text: $record.associations)
                    RecordTextItem(label: "Stem", text: $record.stem)
                    RecordTextItem(label: "Smell", text: $record.smell)
                    RecordTextItem(label: "Taste", text: $record.taste)
                    RecordTextItem(label: "Flesh", text: $record.flesh)
                }
            }
        }
        .navigationBarTitle(" ", displayMode: .inline)
        .padding(4)
        .background(Color(red: 0.8, green: 0.8, blue: 0.8))
        .onDisappear
        {
            onDisappear()
        }
    }
}

struct RecordView_Previews: PreviewProvider
{
    @State static var record = Record()
    static var previews: some View
    {
        RecordView(record: $record, readOnly: false, onDisappear: {})
    }
}
