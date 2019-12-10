//
//  APIConfig.swift
//  iddog
//
//  Created by Lidia Chou on 10/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Alamofire

struct APIConfig {
    
    struct Login {
        static let path = Constants.Urls.Iddog + "/signup"
        static let method: HTTPMethod = .post
        static let headers: HTTPHeaders = ["Content-Type": "application/json"]
    }
    
    struct Feed {
        static let path = Constants.Urls.Iddog + "/feed"
        static let method: HTTPMethod = .get
        static let headers: HTTPHeaders = ["Content-Type": "application/json"]
    }
    
}
