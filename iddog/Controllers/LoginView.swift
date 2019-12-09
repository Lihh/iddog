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
