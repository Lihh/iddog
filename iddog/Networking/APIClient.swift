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
    
    static func login(email: String,
                      completion: @escaping(Login?, Error?)->Void) {
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
                    let user = try decoder.decode(Login.self, from: data)
                    return completion(user, nil)
                } catch {
                    return completion(nil, error)
                }
        }
    }
    
    static func getFeed(token: String,
                        dogBreed: String,
                        completion: @escaping(DogBreed?, Error?)->Void) {
        let path = "\(APIConfig.Feed.path)?category=\(dogBreed)"
        var headers = APIConfig.Feed.headers
        headers["Authorization"] = token
        
        Alamofire.request(path,
                          method: APIConfig.Feed.method,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: headers)
            .responseJSON { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let dogBreed = try decoder.decode(DogBreed.self, from: data)
                    return completion(dogBreed, nil)
                } catch {
                    return completion(nil, error)
                }
        }
    }
}
