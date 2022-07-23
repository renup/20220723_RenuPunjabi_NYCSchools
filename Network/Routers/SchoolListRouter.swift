//
//  SchoolListAPI.swift
//  20220723-RenuPunjabi-NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation

final class SchoolListRouter: APIRouter {
    
    @discardableResult
    func getHighSchoolList(_ completion: @escaping (Result<[School], APIError>) -> Void) -> URLSessionDataTask? {
        return fetch(route: SchoolListEndpoint.schoolList, completion: completion)
    }
}
