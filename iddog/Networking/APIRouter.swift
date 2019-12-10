//
//  AlamofireAPI.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var path: String { get }
    var params: [String: Any] { get }
    var method: HTTPMethod { get }
}

enum APIRouter: APIConfiguration {
    
    case login(email: String)
    case getDogBreeds
    
    var path: String {
        switch self {
        case .login:
            return "/signup"
        case .getDogBreeds:
            return "/feed"
        }
    }
    
    var params: [String: Any] {
        switch self {
        case .login(let email):
            return ["email" : email]
        default:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getDogBreeds:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Urls.Iddog.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        return try URLEncoding.default.encode(urlRequest, with: params)
    }
}
