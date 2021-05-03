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
    let defaultEditorHeight: CGFloat = 75
    
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
                    RecordTextItem(label: "Name", text: $record.name, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Collector", text: $record.collector, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Identifier", text: $record.identifier, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Confirmer", text: $record.confirmer, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Latitude, Longitude",text: $record.coordinates, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Location", text: $record.location, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Cap", text: $record.cap, editorHeight: 100)
                    RecordTextItem(label: "Gills", text: $record.gills, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Pores", text: $record.pores, editorHeight: defaultEditorHeight)
                }
                Group
                {
                    RecordTextItem(label: "Spines", text: $record.spines, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Fruiting Body", text: $record.fruitingBody, editorHeight: 200)
                    RecordTextItem(label: "Substrate", text: $record.substrate, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Associations", text: $record.associations, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Stem", text: $record.stem, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Smell", text: $record.smell, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Taste", text: $record.taste, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Flesh", text: $record.flesh, editorHeight: defaultEditorHeight)
                }
            }
        }
        .navigationBarTitle(" ", displayMode: .inline)
        .padding(4)
        .background(Color(red: 0.7, green: 0.7, blue: 0.7))
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
