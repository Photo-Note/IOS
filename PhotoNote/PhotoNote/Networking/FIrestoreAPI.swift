//
//  FIrestoreAPI.swift
//  PhotoNote
//
//  Created by brian vilchez on 1/2/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import UIKit

class FIrestoreAPI {
    
    static let fireBaseStoreAPI = FIrestoreAPI()
    static var user: User?
    let db = Firestore.firestore()
    
    func signin(withEmail email: String,password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error as NSError? {
                NSLog("login unsuccessful: \(error.localizedDescription)")
            }
            FIrestoreAPI.user = authResult?.user
        }

    }
    
    func register(withEmail email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error as NSError? {
                NSLog("login unsuccessful: \(error.localizedDescription)")
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

    func createProfile(withFirstName firstName: String, lastname: String) {
        db.collection("users").addDocument(data: ["firstname": firstName,
                                                  "lastname": lastname]) { (error) in
            if let error = error as NSError? {
                NSLog("failed to add document: \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        db.collection("users").getDocuments { (querySnapshot, error) in
            if let error = error as NSError? {
                NSLog("failed to retreive profile: \(error.localizedDescription)")
            }
        }
    }
    
    func uploadPhoto(withImage image: UIImage, title: String, note: String ){
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        
        db.collection("pictures").addDocument(data: [
            "imageURL": "\(imageData).jpg",
                                                     "title": title,
                                                     "note": note
            ]) { (error) in
            if let error = error as NSError? {
                NSLog("failed to add image urls to firestore: \(error.localizedDescription)")
            }
        }
    }
}
