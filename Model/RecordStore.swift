//
//  RecordStore.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 28/04/2021.
//

import Foundation

class RecordStore: ObservableObject, Codable
{
    @Published var records: [Record]
    @Published var date: Date
    @Published var dateString: String
    
    private enum CodingKeys: CodingKey
    {
        case records,date
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(records, forKey: .records)
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let tempDate = try container.decode(Date.self, forKey: .date)
        date = tempDate
        let formatter = DateFormat()
        dateString = formatter.FormatDateAsString(date: tempDate)
        records = try container.decode([Record].self, forKey: .records)
    }
    
    init(records: [Record], date: Date, dateString: String)
    {
        self.records = records
        self.date = date
        self.dateString = dateString
    }
}
