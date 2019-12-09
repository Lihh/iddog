//
//  LoginView.swift
//  iddog
//
//  Created by Lidia Chou on 09/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginViewModel = LoginViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.configureView(self)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        loginViewModel.validateEmail(email: emailTextField.text, view: self)
    }
    
    func showInvalidEmailAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default))
        self.present(alert, animated: true, completion: nil)
    }

}

// MARK: - TextField setup
extension LoginView: UITextFieldDelegate {
    
    func setTextFieldDelegate() {
        emailTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
