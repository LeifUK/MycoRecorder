//
//  DataStore.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 19/04/2021.
//

import Foundation
import CoreLocation

final class DataStore: ObservableObject, ISerialiser, Codable
{
    @Published var collections: [RecordStore] = []
    let dateFormat = DateFormat()
        
    private enum CodingKeys: CodingKey
    {
        case collections
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(collections, forKey: .collections)
    }
    
    init()
    {
        
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collections = try container.decode([RecordStore].self, forKey: .collections)
    }
    
    func PopulateTestData() -> DataStore
    {
        collections = [RecordStore]()
        
        // The first day
        
        var date = DateFormat.CreateDate(year: 2021, month: 3, day: 14)
        var records = Array<Record>()
       
        var record = Record()
        record.date = date
        record.species = "Amanita spissa"
        records.append(record)
        
        record = Record()
        record.date = date
        record.species = "Amanita muscaria"
        record.location = "Wisley"
        records.append(record)
        
        record = Record()
        record.date = date
        record.species = "Ganoderma australe"
        record.location = "Wisley"
        records.append(record)
        
        record = Record()
        record.date = date
        record.species = "Boletus edulis"
        record.location = "Stoner Park"
        records.append(record)
        
        // Assign here as an array is a value type!
        collections.append(
            RecordStore(
                records: records,
                date: date,
                dateString: dateFormat.FormatDateAsString(date: date)))

        // The next day
        
        date = DateFormat.CreateDate(year: 2021, month: 3, day: 15)
        records = Array<Record>()
     
        record = Record()
        record.date = date
        record.species = "Peniophora quercina"
        record.location = "Four Marks"
        records.append(record)
        
        record = Record()
        record.date = date
        record.species = "Stereum hirsutum"
        record.location = "Medstead"
        records.append(record)

        collections.append(
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
            from: record.date)
        let year = components.year
        let month = components.month
        let day = components.day

        var found = false
        var index = 0
        for i in 0..<self.collections.indices.count
        {
            components = calendar.dateComponents(
                [.year,.month,.day],
                from: self.collections[i].date)
            if (
                   (components.year == year) &&
                   (components.month == month) &&
                   (components.day == day)
               )
            {
                found = true
                self.collections[i].records.append(record)
                break
            }
            else
            {
                if (self.collections[i].date < record.date)
                {
                    index = i + 1
                }
            }
        }
        if (!found)
        {
            let recordStore = RecordStore(
                records: [Record](),
                date: record.date,
                dateString: dateFormat.FormatDateAsString(date: record.date))
            self.collections.insert(recordStore, at: index)
            self.collections[index].records.append(record)
        }
    }
    
    func SetLongLat(id: UUID, date: Date, longitude: CLLocationDegrees, latitude: CLLocationDegrees) -> Void
    {
        for i in 0..<collections.count
        {
            if (collections[i].date == date)
            {
                for j in 0..<collections[i].records.count
                {
                    if (collections[i].records[j].id == id)
                    {
                        collections[i].records[j].location = String(longitude) + "," + String(latitude)
                        break;
                    }
                }
                break;
            }
        }
    }
    
    // ISerialiser
    
    private func getDocumentsDirectory() -> URL
    {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private func GetFilepath() -> URL
    {
        let pathDirectory = getDocumentsDirectory()
        try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        return pathDirectory.appendingPathComponent(Settings.dataFile + ".json")
    }
    
    func DoLoad() -> DataStore
    {
        Load()
        return self
    }
    
    func Load()
    {
        let filePath = GetFilepath()
        do
        {
            let data = try Data(contentsOf: filePath, options: .alwaysMapped)
            let jsonDecoder = JSONDecoder()
            let jsonData = try jsonDecoder.decode(DataStore.self, from: data)
            collections = jsonData.collections
        }
        catch
        {
            // The file is invalid so just remove all data
            collections = [RecordStore]()
        }
    }

    func Save()
    {
        let data = try? JSONEncoder().encode(self)
        let filePath = GetFilepath()
        do
        {
            try data!.write(to: filePath)
        }
        catch
        {
            print("DataStore.Save() -> failed!")
        }
    }
}
