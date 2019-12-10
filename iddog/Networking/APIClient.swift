//
//  APIClient.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Alamofire

class APIClient {
    
    static func login(email: String) {
        Alamofire.request(APIRouter.login(email: email)).validate()
            .responseJSON { response in
                print(response)
        }
    }
}
