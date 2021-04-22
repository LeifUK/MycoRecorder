//
//  ContentView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 15/04/2021.
//

import SwiftUI

struct ContentView: View
{
    @EnvironmentObject var model: ViewModel

   
    var body: some View
    {
        NavigationView
        {
            VStack(alignment: .center)
            {
                Text("Days").padding().font(.title).foregroundColor(.primary)
                List
                {
                    ForEach(model.Collections.keys.sorted(by: >), id: \.self)
                    {
                        date in
                        NavigationLink(destination: DayView().environmentObject(model.GetDayViewModel(date: date)))
                        {
                            Text(model.DateAsString(date: date))
                        }
                    }

                }
                Spacer()
                Button("View Day"){}
                Button("Filter"){}
                
            }
        }
        .navigationTitle("Days")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel().PopulateTestData())
    }
}
