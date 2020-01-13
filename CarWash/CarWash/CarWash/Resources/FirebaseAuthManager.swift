//
//  FirebaseAuthManager.swift
//  CarWash
//
//  Created by Bogdan Vlas on 1/13/20.
//  Copyright © 2020 Bogdan Vlas. All rights reserved.
//
import Firebase
import FirebaseAuth
import UIKit

class FirebaseAuthManager {

    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
            
            
            guard let userId = authResult?.user.uid else {return}
                Firestore.firestore().collection(USERS_REF).document(userId).setData([
                
                DATE_CREATED : FieldValue.serverTimestamp()
                
                ], completion:  { (error) in
                if let error = error{
                                   debugPrint("Error : \(error.localizedDescription)")
                               } else {
                                    return
                               }
                           })
        }
        
        
        
    }

}
