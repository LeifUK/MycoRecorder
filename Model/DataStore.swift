//
//  DataStore.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 19/04/2021.
//

import Foundation

final class DataStore: ObservableObject, ISerialiser
{
    @Published var Collections: [RecordStore] = []
    let dateFormat = DateFormat()
    
    func PopulateTestData() -> DataStore
    {
        Collections = [RecordStore]()
        
        // The first day
        
        var date = DateFormat.CreateDate(year: 2021, month: 3, day: 14)
        var records = Array<Record>()
       
        var record = Record()
        record.collectionDate = date
        record.name = "Amanita spissa"
        records.append(record)
        
        record = Record()
        record.collectionDate = date
        record.name = "Amanita muscaria"
        record.location = "Wisley"
        records.append(record)
        
        record = Record()
        record.collectionDate = date
        record.name = "Ganoderma australe"
        record.location = "Wisley"
        records.append(record)
        
        record = Record()
        record.collectionDate = date
        record.name = "Boletus edulis"
        record.location = "Stoner Park"
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
        record.collectionDate = date
        record.name = "Peniophora quercina"
        record.location = "Four Marks"
        records.append(record)
        
        record = Record()
        record.collectionDate = date
        record.name = "Stereum hirsutum"
        record.location = "Medstead"
        records.append(record)

        Collections.append(
            RecordStore(
                records: records,
                date: date,
                dateString: dateFormat.FormatDateAsString(date: date)))

        return self
    }
    
    func AddRecord(record: Record) -> Void
    {
        let calendar = Calendar.current
        var components = calendar.dateComponents(
            [.year,.month,.day],
            from: record.collectionDate)
        let year = components.year
        let month = components.month
        let day = components.day

        var found = false
        var index = 0
        for i in 0..<self.Collections.indices.count
        {
            components = calendar.dateComponents(
                [.year,.month,.day],
                from: self.Collections[i].date)
            if (
                   (components.year == year) &&
                   (components.month == month) &&
                   (components.day == day)
               )
            {
                found = true
                self.Collections[i].records.append(record)
                break
            }
            else
            {
                if (self.Collections[i].date < record.collectionDate)
                {
                    index = i + 1
                }
            }
        }
        if (!found)
        {
            let recordStore = RecordStore(
                records: [Record](),
                date: record.collectionDate,
                dateString: dateFormat.FormatDateAsString(date: record.collectionDate))
            self.Collections.insert(recordStore, at: index)
            self.Collections[index].records.append(record)
        }
    }
    
    // ISerialiser
    
    func Load()
    {
        
    }
    
    func Save()
    {
        print("DataStore.Save()")
    }
}
