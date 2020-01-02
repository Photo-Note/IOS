//
//  FIrestoreAPI.swift
//  PhotoNote
//
//  Created by brian vilchez on 1/2/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import Foundation
import Firebase

class FIrestoreAPI {
    
    static var user: User?
    
    func signin(withEmail email: String,password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error as NSError? {
                NSLog("login unsuccesful: \(error.localizedDescription)")
            }
            FIrestoreAPI.user = authResult?.user
        }
    }
    
    func register(withEmail email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error as NSError? {
                NSLog("login unsuccesful: \(error.localizedDescription)")
            }
            FIrestoreAPI.user = authResult?.user
        }
    }
    
    func signout() throws {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            NSLog("Error signing out: %@", signOutError)
        }
    }
    
    func sendEmailVerification() {
        Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
            if let error = error as NSError? {
                NSLog("failed to send verification: \(error.localizedDescription)")
            }
        })
    }
    
    func updatePassword(withPassword password: String) {
        Auth.auth().currentUser?.updatePassword(to: password, completion: { (error) in
            if let error = error as NSError? {
                           NSLog("failed to update password: \(error.localizedDescription)")
                       }
        })
    }
    
    func updateEmail(withEmail email: String) {
        Auth.auth().currentUser?.updateEmail(to: email, completion: { (error) in
            if let error = error as NSError? {
                           NSLog("failed to update email: \(error.localizedDescription)")
                       }
        })
    }
    
    func sendPasswordReset() {
        guard let email = FIrestoreAPI.user?.email else {return }
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error as NSError? {
                                      NSLog("failed to send password reset email: \(error.localizedDescription)")
                                  }
        }
    }
}
