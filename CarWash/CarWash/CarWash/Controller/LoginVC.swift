//
//  ViewController.swift
//  CarWash
//
//  Created by Bogdan Vlas on 11/28/19.
//  Copyright © 2019 Bogdan Vlas. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class LoginVC: UIViewController {

    @IBOutlet weak var loginBTN: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
            didTapLoginButton()
    }
    
    private func didTapLoginButton() {
        let loginManager = FirebaseAuthManager()
        guard let email = emailText.text, let password = passText.text else { return }
        loginManager.signIn(email: email, pass: password) {[weak self] (success) in
            guard let `self` = self else { return }
           
            var message: String = ""
            let handler: (UIAlertAction) -> Void
            if (success) {
                self.present(AddCarVC1.instantiate(), animated: true, completion: nil)
                handler = { _ in self.dismiss(animated: true, completion: nil) }
            } else {
                message = "Incorrect email or password."
                handler = { _ in }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: handler))
                
                
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
    }
}
           


