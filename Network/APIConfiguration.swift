//
//  APIConfiguration.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation

/// Protocol to help facilitate creation of URL request during network calls
protocol APIConfiguration {
    var path: String { get }
    var method: String { get }
    var parameters: [URLQueryItem] { get }
}
