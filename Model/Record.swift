//
//  Record.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 15/04/2021.
//

import Foundation

struct Record: Identifiable, Equatable, Codable
{
    var id = UUID()
    var collectionDate: Date = Date()
    var collector: String = ""
    var identifier: String = ""
    var confirmer: String = ""
    var name: String = ""
    var location: String = ""
    var coordinates: String = ""
    var cap: String = ""
    var gills: String = ""
    var stem: String = ""
    var pores: String = ""
    var spines: String = ""
    var fruitingBody: String = ""
    var substrate: String = ""
    var associations: String = ""
    var smell: String = ""
    var taste: String = ""
    var flesh: String = ""
}
