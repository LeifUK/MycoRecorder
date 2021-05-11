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
                    RecordDateItem(label: "Date", date: $record.date, readOnly: readOnly)
                    RecordTextItem(label: "Species", text: $record.species, editorHeight: defaultEditorHeight)
                    RecordTextItem(label: "Collector", text: $record.collector, editorHeight: defaultEditorHeight)
                    if (Settings.showIdentifier)
                    {
                        RecordTextItem(label: "Identifier", text: $record.identifier, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showConfirmer)
                    {
                        RecordTextItem(label: "Confirmer", text: $record.confirmer, editorHeight: defaultEditorHeight)
                    }
                    RecordTextItem(label: "Location", text: $record.location, editorHeight: defaultEditorHeight)
                    if (Settings.showViceCounty)
                    {
                        RecordTextItem(label: "Vice County", text: $record.viceCounty, editorHeight: 100)
                    }
                    if (Settings.showLatLong)
                    {
                        RecordTextItem(label: "Latitude, Longitude",text: $record.latlong, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showGridRef)
                    {
                        RecordTextItem(label: "Grid Reference",text: $record.gridref, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showCap)
                    {
                        RecordTextItem(label: "Cap", text: $record.cap, editorHeight: 100)
                    }
                }
                Group
                {
                    if (Settings.showGills)
                    {
                        RecordTextItem(label: "Gills", text: $record.gills, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showPores)
                    {
                        RecordTextItem(label: "Pores", text: $record.pores, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showSpines)
                    {
                        RecordTextItem(label: "Spines", text: $record.spines, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showHymenium)
                    {
                        RecordTextItem(label: "Hymenium", text: $record.hymenium, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showStem)
                    {
                        RecordTextItem(label: "Stem", text: $record.stem, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showFruitingBody)
                    {
                        RecordTextItem(label: "Fruiting Body", text: $record.fruitingBody, editorHeight: 200)
                    }
                    if (Settings.showMicroscopy)
                    {
                        RecordTextItem(label: "Microscopy", text: $record.microscopy, editorHeight: 200)
                    }
                    if (Settings.showSubstrate)
                    {
                        RecordTextItem(label: "Substrate", text: $record.substrate, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showAssociatedOrganisms)
                    {
                        RecordTextItem(label: "Associated Organisms", text: $record.assocOrgs, editorHeight: defaultEditorHeight)
                    }
                }
                Group
                {
                    if (Settings.showSmell)
                    {
                        RecordTextItem(label: "Smell", text: $record.smell, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showTaste)
                    {
                        RecordTextItem(label: "Taste", text: $record.taste, editorHeight: defaultEditorHeight)
                    }
                    if (Settings.showFlesh)
                    {
                        RecordTextItem(label: "Flesh", text: $record.flesh, editorHeight: defaultEditorHeight)
                    }
                    RecordTextItem(label: "Comments", text: $record.comments, editorHeight: defaultEditorHeight)
                }
            }
        }
        .navigationBarTitle(" ", displayMode: .inline)
        .padding(4)
        .background(Color(red: 0.7, green: 0.7, blue: 0.7))
        .onDisappear
        {
            record.dateString = DateFormat().FormatDateAsString(date: record.date)
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
