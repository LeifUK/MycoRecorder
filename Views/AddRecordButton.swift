//
//  AddRecordButton.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 14/05/2021.
//

import SwiftUI

struct AddRecordButton: View
{
    @Binding var record: Record
    var date: Date
    var locationManager = LocationManager()
    var onClick: () -> Void

    var body: some View
    {
        Button("Add")
        {
            record.latlong = "Waiting for data ..."
            record.location = "Waiting for data ..."
            record.date = date
            record.collector = Settings.defaultCollector
            record.viceCounty = ViceCounties[0] ?? ""
            locationManager.RequestLocation(
                latLongCallback:
                {
                   latlong in
                   record.latlong = latlong
                },
                locationCallback:
                {
                    location in
                    record.location = location
                })
            onClick()
        }
    }
}

struct AddRecordButton_Previews: PreviewProvider
{
    @State static var record = Record()

    static var previews: some View
    {
        AddRecordButton(record: $record, date: Date(), onClick: {})
    }
}
 
