//
//  DayViewModel.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 19/04/2021.
//

import Foundation

class DayViewModel: ObservableObject
{
    static func == (lhs: DayViewModel, rhs: DayViewModel) -> Bool
    {
        lhs.date == rhs.date
    }
    
    var dateString: String = ""
    var date: Date = Date()
    var records: Array<RecordViewModel> = []
}
