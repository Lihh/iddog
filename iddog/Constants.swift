//
//  GlobalConstants.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

struct Constants {
    
    struct Keys {
        static let token = "token"
        static let email = "email"
    }
    
    struct Urls {
        static let Iddog = "https://api-iddog.idwall.co"
    }
    
    struct Colors {
        static let purple = 0x7430F5
    }
    
    struct ErrorAlerts {
        static let titleError = "Error"
        static let titleSorry = "Sorry"
        static let titleInvalidEmail = "Invalid Email"
        
        static let messageInvalidEmail = "Please enter a valid email"
        static let messageEmptyTextField = "You need to write a dog breed to search"
        static let messageDogBreedNotFound = "We didn't find any pictures related to this dog breed"
        
        static let okButton = "Ok"
    }
}
