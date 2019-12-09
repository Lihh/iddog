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
    
    // MARK: - email validation
    func validateEmail(email: String?, view: LoginView) {
        if isEmailValid(email) {
            print("valid email")
        } else {
            showInvalidEmailAlert(view)
        }
    }
    
    func isEmailValid(_ email: String?) -> Bool {
        guard let emailString = email else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailString)
    }
    
    func showInvalidEmailAlert(_ view: LoginView) {
        let title = "Invalid Email"
        let message = "Please enter a valid email"
        let buttonTitle = "OK"
        view.showInvalidEmailAlert(title: title,
                                   message: message,
                                   buttonTitle: buttonTitle)
    }
    
}
