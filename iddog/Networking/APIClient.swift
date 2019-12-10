//
//  APIClient.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Alamofire

class APIClient {
    
    static func login(email: String) {//, completion:@escaping (Result<User>)->Void) {
//        performRequest(route: APIRouter.login(email: email), completion: completion).auth
        Alamofire.request(APIRouter.login(email: email)).validate()
            .responseJSON { response in
                print(response)
        }
            
//            .response { (response) in
//            print(response)
//        }
//        Alamofire.request(APIRouter.login(email: email),
//                          encoder: JSONParameterEncoder.default).response { response in
//            debugPrint(response)
        
//        var request = APIRouter.login(email: email)
        
        
        }
    }
//}
