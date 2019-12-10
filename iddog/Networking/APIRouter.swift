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
    var params: Parameters? { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
}

enum APIRouter: APIConfiguration {
    
    case login(email: String)
    case getDogBreeds(token: String)
    
    var path: String {
        switch self {
        case .login:
            return "/signup"
        case .getDogBreeds:
            return "/feed"
        }
    }
    
    var params: Parameters? {
        switch self {
        case .login(let email):
            return ["email" : email]
        default:
            return nil
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
    
    var headers: HTTPHeaders {
        switch self {
        case .login:
            return ["Content-Type": "application/json"]
        case .getDogBreeds(let token):
            return ["Content-Type": "application/json",
                    "Authorization": token]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Urls.Iddog.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = method.rawValue
        
        return try URLEncoding.default.encode(urlRequest, with: params)
    }
}
