//
//  SchoolDetailViewModel.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/30/22.
//

import Foundation

enum Section: Int, CaseIterable {
   case admissionPriority, address, contactInformation, website
    
    var header: String {
        switch self {
        case .admissionPriority:
            return "Admission priority".localizedCapitalized
        case .address:
            return "address".localizedCapitalized
        case .contactInformation:
            return "contact information".localizedCapitalized
        case .website:
            return "website".localizedCapitalized
        }
    }
}

final class SchoolDetailViewModel {
    
    var school: School
    var dataSource = [Section]()
    
    init(school: School) {
        self.school = school
        dataSource = createDataSource()
        print("data source count = \(dataSource.count)")
        dataSource.map { print($0.header)}
    }
    
    func createDataSource() -> [Section] {
        if (school.admissionsPriority1 != nil) || (school.admissionsPriority2 != nil) || (school.admissionsPriority3 != nil) {
            return Section.allCases
        } else {
            return [.address, .contactInformation, .website]
        }
    }
    
    // ideally, this data should be driven by backend. The response sent to us is all in same level so had to run through a switch statement like below.
    
    //If the response was organized in parts, then we wouldn't need to hardcode the numberOfRows here
    func numberOfRowsInSection(_ section: Section) -> Int {
        switch section {
        case .admissionPriority:
            return dataSource.contains(.admissionPriority) ? 3 : 0
        case .address:
            return school.buildingCode != nil ? 5 : 4
        case .contactInformation:
            if school.faxNumber != nil && school.schoolEmail != nil {
                return 3
            } else if school.faxNumber == nil && school.schoolEmail == nil {
                return 1
            } else {
                return 2
            }
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
