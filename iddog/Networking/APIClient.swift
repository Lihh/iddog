//
//  APIClient.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    static func login(email: String, completion: @escaping (Login?, Error?) -> Void) {
        let params = ["email" : email]
        Alamofire.request(APIConfig.Login.path,
                          method: APIConfig.Login.method,
                          parameters: params,
                          encoding: JSONEncoding.default,
            headers: APIConfig.Login.headers).validate()
            .responseJSON { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let user = try! decoder.decode(Login.self, from: data)
                    return completion(user, nil)
                }
                
//                print(response)
        }
    }
    
    static func getFeed(token: String) {
        //add token to header
    }
}
