//
//  ContentView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 15/04/2021.
//

import SwiftUI

struct ContentView: View
{
    // Warning warning
    var model = ViewModel()
    @State var collections: [[RecordViewModel]]
    @State var dates: [Date]
   
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
                        let dateString = model.FormatDateAsString(date: collections[i][0].CollectionDate)
                        NavigationLink(destination: DayView(
                                        records: $collections[i],
                                        date: dateString))
                        {
                            Text(dateString)
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
                    
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    @State static var model = ViewModel().PopulateTestData()
    static var previews: some View
    {
        ContentView(collections: model.Collections, dates: model.Dates)
    }
}
