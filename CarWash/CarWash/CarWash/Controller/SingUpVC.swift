//
//  SingUpVC.swift
//  CarWash
//
//  Created by Bogdan Vlas on 12/1/19.
//  Copyright © 2019 Bogdan Vlas. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SingUpVC: UIViewController {
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var createBTN: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        [firstNameText, lastNameText, emailText, passText].forEach { $0?.delegate = self }
        createAccountButton.backgroundColor = .lightGray
        createAccountButton.layer.cornerRadius = createAccountButton.frame.height / 2
        createAccountButton.clipsToBounds = true
    }
        
    
    @IBAction func didTapCreateNewAccount(_ sender: Any) {
        didTapSignUpButton()
        
        
    }
    
    private func didTapSignUpButton() {
        let signUpManager = FirebaseAuthManager()
        if let email = emailText.text, let password = passText.text {
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let `self` = self else { return }
                var message: String = ""
                let handler: (UIAlertAction) -> Void
                if (success) {
                    message = "User was sucessfully created."
                    handler = { _ in self.dismiss(animated: true, completion: nil) }
                } else {
                    message = "Error creating the user."
                    handler = { _ in }
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: handler))
                
                
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
    }
}

extension SingUpVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isButtonEnabled = [firstNameText, lastNameText, emailText, passText]
            .compactMap { !($0?.text?.isEmpty ?? true) }
            .reduce(true, { $0 && $1 })
        
        createAccountButton.isEnabled = isButtonEnabled
    
        isButtonEnabled ? (createAccountButton.setGradientBackground(colorOne: Colors.brightBlue, colorTwo: Colors.darkBlue)) : (createAccountButton.setGradientBackground(colorOne: Colors.grey, colorTwo: Colors.grey))
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
