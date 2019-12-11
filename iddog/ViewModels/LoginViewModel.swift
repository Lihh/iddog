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
    
    var titleText: String {
        return "Welcome to iddog app!"
    }
    var loginButtonText: String {
        return "Login"
    }
    var textFieldPlaceholder: String {
        return "Type a valid email here"
    }
    let localStorage = LocalStorage()
    
    func configureView(_ view: LoginViewController) {
        view.titleLabel.text = titleText
        view.emailTextField.placeholder = textFieldPlaceholder
        view.loginButton.setTitle(loginButtonText, for: .normal)
    }
    
    // MARK: - email validation
    func validateLogin(email: String, view: LoginViewController) {
        if isEmailValid(email) {
            APIClient.login(email: email) { (login, error) in
                if let login = login {
                    self.saveUserLocally(login: login)
                    self.goToFeedView(view)
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
        view.showInvalidEmailAlert(title: Constants.ErrorAlerts.titleInvalidEmail,
                                   message: Constants.ErrorAlerts.messageInvalidEmail,
                                   buttonTitle: Constants.ErrorAlerts.okButton)
    }
    
    // MARK: - Save token and email locally
    func saveUserLocally(login: Login) {
        localStorage.saveUserDefaultValue(login.user.token,
                                          key: Constants.Keys.token)
        localStorage.saveUserDefaultValue(login.user.email,
                                          key: Constants.Keys.email)
    }
}

// MARK: - Navigation
extension LoginViewModel {
    
    func goToFeedView(_ view: LoginViewController) {
        let vc = FeedViewController(nibName: "FeedViewController", bundle: nil)
        view.goToFeedView(vc)
    }
}
