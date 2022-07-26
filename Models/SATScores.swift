//
//  SATScores.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/31/22.
//

import Foundation

/// Model: to covert network raw response (json format) into a structure to help display data for the user
struct SATScores: Decodable {
    let reading: String
    let math: String
    let writing: String
    
    enum CodingKeys: String, CodingKey {
        case reading = "sat_critical_reading_avg_score"
        case math = "sat_math_avg_score"
        case writing = "sat_writing_avg_score"
    }
}
