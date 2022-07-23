//
//  APIRouter.swift
//  20220723_RenuPunjabi_NYCSchools
//
//  Created by Anil Punjabi on 7/23/22.
//

import Foundation

enum APIError: Error {
    case invalidEndpoint
    case missingData
    case serviceUnavailable
    case invalidResponse
    case decodingError
    
    var description: String {
        switch self {
        case .serviceUnavailable:
            return "API failed. Unable to fetch data at this time. Try again in few minutes"
        case .invalidEndpoint:
            return "URL passed was incorrect. Please check if URL and parameters are sent correctly"
        case .invalidResponse:
            return "Invalid response"
        case .missingData:
            return "No data received"
        case .decodingError:
            return "There was a problem in decoding your model"
        }
    }
}

protocol APIRouter {
    
    @discardableResult
    func fetch<T: Decodable>(route: APIConfiguration, completion: @escaping(Result<T, APIError>) -> Void) -> URLSessionDataTask?
}

extension APIRouter {
    
    func getURL(route: APIConfiguration) -> URL? {
        let path = route.path
        var components = URLComponents(string: path)
        components?.queryItems = route.parameters
        return components?.url
    }
    
    func fetch<T: Decodable>(route: APIConfiguration, completion: @escaping(Result<T, APIError>) -> Void) -> URLSessionDataTask? {
        
        guard let url = getURL(route: route) else {
            completion(.failure(.invalidEndpoint))
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: url) { result in
            switch result {
                
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    DispatchQueue.main.async {
                        completion(.failure(.invalidResponse))
                    }
                    return
                }
                do {
                    let desiredResult = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(desiredResult))
                    }
                } catch let err {
                    printDecodingError(error: err)
                    DispatchQueue.main.async {
                        completion(.failure(.decodingError))
                    }
                }
                
            case .failure(let error):
                print("error during fetch: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(.serviceUnavailable))
                }
            }
        }
            
        task.resume()
        return task
    }
    
    private func printDecodingError(error: Error) {
        if let er =  error as? DecodingError {
            switch er {
            case .typeMismatch(let key, let value):
              print("error \(key), value \(value) and ERROR: \(er.localizedDescription)")
            case .valueNotFound(let key, let value):
              print("error \(key), value \(value) and ERROR: \(er.localizedDescription)")
            case .keyNotFound(let key, let value):
              print("error \(key), value \(value) and ERROR: \(er.localizedDescription)")
            case .dataCorrupted(let key):
              print("error \(key), and ERROR: \(er.localizedDescription)")
            default:
              print("ERROR: \(er.localizedDescription)")
            }
        }
    }
    
}
