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
    
     override func viewDidLoad() {
        super.viewDidLoad()
    
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
                if (success) {
                    message = "User was sucessfully created."
                } else {
                    message = "There was an error."
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                    self.dismiss(animated: true, completion: nil)
                }))
                
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
    }
}

