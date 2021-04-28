//
//  RecordStore.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 28/04/2021.
//

import Foundation

class RecordStore: ObservableObject
{
    @Published var records: [Record]
    @Published var date: Date
    @Published var dateString: String
    
    init(records: [Record], date: Date, dateString: String)
    {
        self.records = records
        self.date = date
        self.dateString = dateString
    }
}
