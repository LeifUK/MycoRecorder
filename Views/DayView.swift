//
//  DayView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 19/04/2021.
//

import SwiftUI

struct DayView: View
{
    @Binding var records: Array<RecordViewModel>
    @State var date: String
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            List
            {
                ForEach(0..<records.count)
                {
                    i in
                    NavigationLink(destination: RecordView(record: $records[i]))
                    {
                        HStack
                        {
                            Text(records[i].Name)
                            Text(records[i].Location)
                        }
                    }
                    .padding(0)
                }
            }
        }
        .navigationBarTitle(date)
        .navigationBarItems(trailing: Button("Add Record"){})
    }
}

struct DayView_Previews: PreviewProvider
{
    @State static var records = Array<RecordViewModel>()
    @State static var date: String = "March 1 2000"

    static var previews: some View
    {
        DayView(records: $records, date: date)
    }
}
