//
//  ContentView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 15/04/2021.
//

import SwiftUI

struct ContentView: View
{
    //@State var collections: [[Record]]
    @State var collections: [RecordStore]
    //@State var dates: [Date]
    
    let dateFormatter = DateFormat()

    var body: some View
    {
        NavigationView
        {
            VStack
            {
                List
                {
                    ForEach(0..<collections.count)
                    {
                        i in
                        NavigationLink(destination: DayView(
                                        recordStore: collections[i]))
                        {
                            Text(collections[i].dateString)
                        }
                    }
                }
            }
            .navigationBarTitle("Days")
            .navigationBarItems(trailing:
                HStack
                {
                    Button("Filter"){}
                    Button("Settings"){}
                    Button("Add")
                    {
                        var record = Record()
                        record.Name = "Test"
                        record.CollectionDate = collections[0].date
                        collections[0].records.append(record)
                    }
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    @State static var model = DataStore().PopulateTestData()
    static var previews: some View
    {
        ContentView(collections: model.Collections)
    }
}
