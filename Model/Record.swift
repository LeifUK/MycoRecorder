//
//  Record.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 15/04/2021.
//

import Foundation

struct Record: Identifiable, Equatable
{
    let id = UUID()
    var CollectionDate: Date = Date()
    var Name: String = ""
    var Location: String = ""
    var Coordinates: String = ""
    var Cap: String = ""
    var Gills: String = ""
    var Stem: String = ""
    var Pores: String = ""
    var Spines: String = ""
    var FruitingBody: String = ""
    var Substrate: String = ""
    var Associations: String = ""
    var Smell: String = ""
    var Taste: String = ""
    var Flesh: String = ""
}
