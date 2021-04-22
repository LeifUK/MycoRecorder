//
//  DayView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 19/04/2021.
//

import SwiftUI

struct DayView: View
{
    @EnvironmentObject var model: DayViewModel

    var body: some View
    {
        NavigationView
        {
            VStack(alignment: .center)
            {
                List
                {
                    ForEach(model.records, id: \.Id)
                    {
                        record in
                        NavigationLink(destination: RecordView().environmentObject(record))
                        {
                            HStack
                            {
                                Text(record.Name)
                                Text(record.Location)
                            }
                        }
                    }
                }
                Spacer()
                Button("View Day"){}
                Button("Filter"){}
                
            }
        }
        .navigationTitle(model.dateString)
    }
}

struct DayView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DayView()
    }
}
