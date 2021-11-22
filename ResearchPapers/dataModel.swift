//
//  dataModel.swift
//  ResearchPapers
//
//  Created by Joao Garrido on 22/11/2021.
//

import Foundation

struct techReport : Decodable {
    let year : String
    let id : String
    let owner : String?
    let email : String?
    let authors : String
    let title : String
    let abstract : String?
    let pdf : URL?
    let comment : String?
    let lastModified : String
}

struct technicalReports : Decodable {
    let techReports2 : [techReport]
}
