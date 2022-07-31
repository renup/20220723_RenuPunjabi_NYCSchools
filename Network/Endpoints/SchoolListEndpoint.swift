//
//  SchoolListEndpoint.swift
//  20220723-RenuPunjabi-NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation

enum SchoolListEndpoint: APIConfiguration {
   
    struct Constants {
        static let baseURL = "https://data.cityofnewyork.us"
        static let listResource = "/resource/s3k6-pzi2.json"
        static let satResource = "/resource/f9bf-2cp4.json"
    }
    
    case schoolList
    case satScores(dbn: String)
    
    var path: String {
        switch self {
        case .schoolList:
            return Constants.baseURL + Constants.listResource
        case .satScores:
            return Constants.baseURL + Constants.satResource
        }
    }
    
    var method: String {
        switch self {
        case .schoolList, .satScores:
            return "GET"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .schoolList:
            return []
        case .satScores(let dbn):
            let item = URLQueryItem(name: "dbn", value: dbn)
            return [item]
        }
    }
    
    
}
