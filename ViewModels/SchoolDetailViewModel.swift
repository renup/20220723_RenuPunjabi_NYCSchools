//
//  SchoolDetailViewModel.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/30/22.
//

import Foundation

enum Section: Int, CaseIterable {
   case admissionPriority, address, contactInformation, website
    
    var cellIdentifier: String {
        switch self {
        case .admissionPriority:
            return "AdmissionPriorityCell"
        case .address:
            return "AddressCell"
        case .contactInformation:
            return "SchoolContactCell"
        case .website:
            return "SchoolWebsiteCell"
        }
    }
}

final class SchoolDetailViewModel {
    
    struct Constants {
        static let admissionPriorityCell = "AdmissionPriorityCell"
        static let addressCell = "AddressCell"
        static let contactCell = "SchoolContactCell"
        static let websiteCell = "SchoolWebsiteCell"
    }
    
    var school: School
    
    init(school: School) {
        self.school = school
    }
    
    var numberOfSections: Int {
        return Section.allCases.count
    }
    
    // ideally, this data should be driven by backend. The response sent to us is all in same level so had to run through a switch statement like below.
    
    //If the response was organized in parts, then we wouldn't need to hardcode the numberOfRows here
    func numberOfRowsInSection(_ section: Section) -> Int {
        switch section {
        case .admissionPriority:
            return 3
        case .address:
            return 5
        case .contactInformation:
            return 3
        case .website:
            return 1
        }
    }
    
//    func identifierForCell(in section: Int) -> String {
//        guard let sec = Section(rawValue: section) else { return "" }
//        switch sec {
//        case .admissionPriority: return Constants.admissionPriorityCell
//            
//        }
//    }
    
    
}
