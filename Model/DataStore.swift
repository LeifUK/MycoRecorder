//
//  DataStore.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 19/04/2021.
//

import Foundation

final class DataStore: ObservableObject
{
    // Warning warning
    var record: Record = Record()
    @Published var Collections: [RecordStore] = []
    let dateFormat = DateFormat()
    
    func PopulateTestData() -> DataStore
    {
        Collections = [RecordStore]()
        
        // The first day
        
        var date = DateFormat.CreateDate(year: 2021, month: 3, day: 14)
        var records = Array<Record>()
       
        var record = Record()
        record.CollectionDate = date
        record.Name = "Amanita spissa"
        records.append(record)
        
        record = Record()
        record.CollectionDate = date
        record.Name = "Amanita muscaria"
        record.Location = "Wisley"
        records.append(record)
        
        record = Record()
        record.CollectionDate = date
        record.Name = "Ganoderma australe"
        record.Location = "Wisley"
        records.append(record)
        
        record = Record()
        record.CollectionDate = date
        record.Name = "Boletus edulis"
        record.Location = "Stoner Park"
        records.append(record)
        
        // Assign here as an array is a value type!
        Collections.append(
            RecordStore(
                records: records,
                date: date,
                dateString: dateFormat.FormatDateAsString(date: date)))

        // The next day
        
        date = DateFormat.CreateDate(year: 2021, month: 3, day: 15)
        records = Array<Record>()
     
        record = Record()
        record.CollectionDate = date
        record.Name = "Peniophora quercina"
        record.Location = "Four Marks"
        records.append(record)
        
        record = Record()
        record.CollectionDate = date
        record.Name = "Stereum hirsutum"
        record.Location = "Medstead"
        records.append(record)

        Collections.append(
            RecordStore(
                records: records,
                date: date,
                dateString: dateFormat.FormatDateAsString(date: date)))

        return self
    }
}
