//
//  School.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation

struct School: Decodable {
    let dbn: String
    let schoolName: String
    let neighborhood: String
    let schoolSports: String?
    let location: String
   
    let extracurricularActivities: String?
    
    let admissionsPriority1: String?
    let admissionsPriority2: String?
    let admissionsPriority3: String?
    
    let primaryAddress: String
    let buildingCode: String?
    let city: String
    let zip: String
    let stateCode: String
    
    let phoneNumber: String
    let faxNumber: String?
    let schoolEmail: String?
    
    let website: String

    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case neighborhood
        case schoolSports = "school_sports"
        case location
        case buildingCode = "building_code"
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website
        case extracurricularActivities = "extracurricular_activities"
        case admissionsPriority1 = "admissionspriority11"
        case admissionsPriority2 = "admissionspriority21"
        case admissionsPriority3 = "admissionspriority31"
        case primaryAddress = "primary_address_line_1"
        case city
        case zip
        case stateCode = "state_code"
    }
}


