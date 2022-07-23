//
//  School.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation

struct School: Decodable {
    let schoolName: String
    let neighborhood: String
    
    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case neighborhood
    }
}
