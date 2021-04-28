//
//  DateFormatter.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 27/04/2021.
//

import Foundation

class DateFormat
{
    let dateFormatter = DateFormatter()
    
    init()
    {
        dateFormatter.dateStyle = .long
    }
    
    func FormatDateAsString(date: Date) -> String
    {
        return dateFormatter.string(from: date)
    }
    
    static func CreateDate(year: Int, month: Int, day: Int) -> Date
    {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!

        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day

        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }
}
