//
//  LoginViewModel.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Foundation
import UIKit

class LoginViewModel {
    
    var navTitle: String {
        return "IDDOG"
    }
    var titleText: String {
        return "Welcome to iddog app!"
    }
    var loginButtonText: String {
        return "LOGIN"
    }
    var textFieldPlaceholder: String {
        return "Type a valid email here"
    }
    var localStorage = LocalStorage()
    
    func configureView(_ view: LoginViewController) {
        view.titleLabel.text = titleText

        view.emailTextField.placeholder = textFieldPlaceholder
        
        view.loginButton.titleLabel?.text = loginButtonText
    }
    
    // MARK: - email validation
    func validateEmail(email: String?, view: LoginViewController) {
        guard let email = email else {
            showInvalidEmailAlert(view)
            return
        }
        
        if isEmailValid(email) {
            APIClient.login(email: email) { (login, error) in
                if let login = login {
                    self.localStorage.saveUserDefaultValue(login.user.token,
                                                           key: Constants.Keys.token)
                    self.localStorage.saveUserDefaultValue(login.user.email,
                                                           key: Constants.Keys.email)
                }
            }
        } else {
            showInvalidEmailAlert(view)
        }
    }
    
    func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func showInvalidEmailAlert(_ view: LoginViewController) {
        let title = "Invalid Email"
        let message = "Please enter a valid email"
        let buttonTitle = "OK"
        view.showInvalidEmailAlert(title: title,
                                   message: message,
                                   buttonTitle: buttonTitle)
    }
    
}
