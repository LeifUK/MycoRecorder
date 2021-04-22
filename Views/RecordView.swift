//
//  RecordView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 16/04/2021.
//

import SwiftUI

struct RecordView: View
{
    @EnvironmentObject var record: Record
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text("Name")
                Text(record.Name)
            }
            HStack
            {
                Text("Coordinates")
                Text(record.Coordinates)
            }
            HStack
            {
                Text("Location")
                Text(record.Location)
            }
            HStack
            {
                Text("Cap")
                Text(record.Cap)
            }
            HStack
            {
                Text("Gills")
                Text(record.Gills)
            }
            HStack
            {
                Text("Pores")
                Text(record.Pores)
            }
            HStack
            {
                Text("Stem")
                Text(record.Stem)
            }
        }
    }
}

struct RecordView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecordView()
    }
}
