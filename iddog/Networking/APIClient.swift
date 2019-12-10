//
//  APIClient.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Alamofire

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void) -> DataRequest {
        return Alamofire.request(route)
    }
    
    static func login(email: String, completion:@escaping (Result<User>)->Void) {
        performRequest(route: APIRouter.login(email: email), completion: completion)
    }
}
