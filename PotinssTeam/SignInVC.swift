//
//  SignInVC.swift
//  PotinssTeam
//
//  Created by Guner Babursah on 29/11/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

class SignInVC: UIViewController, UITextFieldDelegate {
    
    //IBOUTLETS:
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passwordField.delegate = self
        
    }
    
    //KEYCHAIN WRAPPER
    override func viewDidAppear(_ animated: Bool) {
        if KeychainWrapper.standard.string(forKey: KEY_UID) != nil {
            print("ARTH: Keychain Uid found.")
            performSegue(withIdentifier: "goToTeamGoals", sender: nil)
        }
    }
    
    //FIREBASE EMAIL AUTH
    @IBAction func singInTapped(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("ARTH: User authenticated with firebase.")
                    if let user = user {
                        let userData = ["email": user.email]
                        self.completeSignIn(id: user.uid, userData: userData as! Dictionary<String, String>)
                    }
                } else {
                    self.errorLbl.text = "No such gossipper is found !"
                }
            })
        }
    }
    
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("ARTH: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToTeamGoals", sender: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    
    
    
    
    
    
    

    

}
