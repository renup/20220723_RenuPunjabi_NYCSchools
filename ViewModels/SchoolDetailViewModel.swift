//
//  SchoolDetailViewModel.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/30/22.
//

import Foundation

enum Section: Int, CaseIterable {
   case admissionPriority, address, contactInformation, website
}

final class SchoolDetailViewModel {
    
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
    
    func textForCell(in section: Section, at index: Int) -> String {
        var data = [String]()
        switch section {
        case .admissionPriority:
            data = [school.admissionsPriority1 ?? "", school.admissionsPriority2 ?? "", school.admissionsPriority3 ?? ""]
        case .address:
            data = [school.primaryAddress, school.buildingCode ?? "", school.city, school.zip, school.stateCode]
        case .contactInformation:
            data = [school.phoneNumber, school.faxNumber ?? "", school.schoolEmail ?? ""]
        case .website:
            data = [school.website]
        }
        return index < data.count ? data[index] : ""
    }
    
    
}
