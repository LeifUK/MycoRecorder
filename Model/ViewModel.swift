//
//  Data.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 19/04/2021.
//

import Foundation

final class ViewModel: ObservableObject
{
    var Collections: Dictionary<Date,[Record]> = [:]
    
    // Needed?
    var Dates: Array<Date> = [Date]()

    let dateFormatter = DateFormatter()
    init()
    {
        dateFormatter.dateStyle = .long
    }
    
    func CreateDate(year: Int, month: Int, day: Int) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!

        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day

        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }
    
    func PopulateTestData() -> ViewModel
    {
        var recordId = 0
        
        Collections = [Date : [Record]]()
        
        // The first day
        
        var date = CreateDate(year: 2021, month: 3, day: 14)
        var records = Array<Record>()
       
        var record = Record()
        record.Id = recordId
        recordId += 1
        record.CollectionDate = date
        record.Name = "Amanita spissa"
        records.append(record)
        
        record = Record()
        record.Id = recordId
        recordId += 1
        record.CollectionDate = date
        record.Name = "Amanita muscaria"
        record.Location = "Wisley"
        records.append(record)
        
        record = Record()
        record.Id = recordId
        recordId += 1
        record.CollectionDate = date
        record.Name = "Ganoderma australe"
        record.Location = "Wisley"
        records.append(record)
        
        record = Record()
        record.Id = recordId
        recordId += 1
        record.CollectionDate = date
        record.Name = "Boletus edulis"
        record.Location = "Stoner Park"
        records.append(record)

        // Assign here as an array is a value type!
        Collections[date] = records

        // The next day
        
        date = CreateDate(year: 2021, month: 3, day: 15)
        records = Array<Record>()
     
        record = Record()
        record.Id = recordId
        recordId += 1
        record.CollectionDate = date
        record.Name = "Peniophora quercina"
        record.Location = "Four Marks"
        records.append(record)
        
        record = Record()
        record.Id = recordId
        recordId += 1
        record.CollectionDate = date
        record.Name = "Stereum hirsutum"
        record.Location = "Medstead"
        records.append(record)

        // Assign here as an array is a value type!
        Collections[date] = records

        return self
    }
    
    func DateAsString(date: Date) -> String
    {
        return dateFormatter.string(from: date)
    }

    func GetDayViewModel(date: Date) -> DayViewModel!
    {
        if (Collections[date] == nil)
        {
            return nil
        }
    
        let dayViewModel = DayViewModel()
        dayViewModel.date = date;
        dayViewModel.dateString = dateFormatter.string(from: date)
        dayViewModel.records = Collections[date]!
        return dayViewModel
    }
}
