//
//  LoginViewModel.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var titleText: String {
        return "Welcome to iddog app!"
    }
    
    var loginButtonText: String {
        return "LOGIN"
    }
    
    var textFieldPlaceholder: String {
        return "Type a valid email here"
    }
    
    func configureView(_ view: LoginView) {
        view.titleLabel.text = titleText
        
        view.emailTextField.placeholder = textFieldPlaceholder
        
        view.loginButton.titleLabel?.text = loginButtonText
    }
    
}
