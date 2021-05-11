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
    var date: Date = Date()
    var dateString: String = ""
    var species: String = ""
    var collector: String = ""
    var identifier: String = ""
    var confirmer: String = ""
    var location: String = ""
    var viceCounty: String = ""
    var latlong: String = ""
    var gridref: String = ""
    var cap: String = ""
    var gills: String = ""
    var stem: String = ""
    var pores: String = ""
    var spines: String = ""
    var hymenium: String = ""
    var fruitingBody: String = ""
    var microscopy: String = ""
    var substrate: String = ""
    var assocOrgs: String = ""
    var smell: String = ""
    var taste: String = ""
    var flesh: String = ""
    var comments: String = ""
}
