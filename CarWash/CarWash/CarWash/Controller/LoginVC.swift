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
    
    @IBAction func loginAction(_ sender: Any) {
        guard let email = emailText.text,
            let password = passText.text else {return}
          
        Auth.auth().signIn(withEmail: email, password: password) { (user , error) in
            if let error = error {
                debugPrint("Erorr : \(error.localizedDescription)")
            }else {
                self.dismiss(animated: (true), completion: nil)
            }
        }
    
    }
}

