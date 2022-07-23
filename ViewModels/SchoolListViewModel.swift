//
//  SchoolListViewModel.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation

final class SchoolListViewModel {
    
    var router: SchoolListRouter

    init(router: SchoolListRouter) {
        self.router = router
    }
    
    func fetchSchoolList(_ completion: @escaping(Result<[School], APIError>) -> Void) {
        router.getHighSchoolList { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                print("error during school list fetch = \(error.description)")
                completion(.failure(error))
            }
        }
    }
}

