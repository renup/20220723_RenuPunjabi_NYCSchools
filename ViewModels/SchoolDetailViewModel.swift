//
//  SchoolDetailViewModel.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/30/22.
//

import Foundation

enum Section: Int, CaseIterable {
   case scores, admissionPriority, address, contactInformation, website
    
    var header: String {
        switch self {
        case .admissionPriority:
            return "admission priority".localizedCapitalized
        case .address:
            return "address".localizedCapitalized
        case .contactInformation:
            return "contact information".localizedCapitalized
        case .website:
            return "website".localizedCapitalized
        case .scores:
            return "SAT scores".localizedCapitalized
        }
    }
}

final class SchoolDetailViewModel {
    
    var school: School
    var dataSource = [Section]()
    var satScores: SATScores?
    var router: SchoolListRouter
    
    init(school: School, router: SchoolListRouter = SchoolListRouter()) {
        self.school = school
        self.router = router
        createDataSource()
    }
    
    func fetchScores(_ completion: @escaping (Result<[SATScores], APIError>) -> Void) {
        router.getSatScores(dbn: school.dbn, completion)
    }
    
    func createDataSource() {
        if (school.admissionsPriority1 != nil) || (school.admissionsPriority2 != nil) || (school.admissionsPriority3 != nil) {
            dataSource = Section.allCases
        } else {
            dataSource = [.scores, .address, .contactInformation, .website]
        }
    }
    
    // Ideally, this data should be driven by backend. The response sent to us is all in same level so had to run through a switch statement like below.
    
    // If the response was organized in parts, then we wouldn't need to hardcode the numberOfRows here
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
        case .scores:
            return 3
        }
    }
    
    func textForCell(in section: Section, at index: Int) -> String {
        var data = [String]()
        switch section {
        case .admissionPriority:
            data = [school.admissionsPriority1 ?? "", school.admissionsPriority2 ?? "", school.admissionsPriority3 ?? ""]
        case .address:
            data = [
                "Address line 1: \(school.primaryAddress)",
                "Building code: \(school.buildingCode ?? "")",
                "City: \(school.city)",
                "Zip: \(school.zip)",
                "State: \(school.stateCode)"
            ]
        case .contactInformation:
            data = [
                "Phone number:\(school.phoneNumber)",
                "Fax number: \(school.faxNumber ?? "")",
                "Email: \(school.schoolEmail ?? "")"
            ]
        case .website:
            data = ["Website: https://\(school.website)"]
        case .scores:
            data = [
                "Reading: \(satScores?.reading ?? "Missing Information")",
                "Math: \(satScores?.math ?? "Missing Information")",
                "Writing: \(satScores?.writing ?? "Missing Information")"
            ]
        }
        return index < data.count ? data[index] : ""
    }
    
    
}
