//
//  DataService.swift
//  PotinssTeam
//
//  Created by Guner Babursah on 29/11/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import SwiftKeychainWrapper

let DB_BASE = Database.database().reference()

class DataService {
    
    static let ds = DataService()
    
    //DB References:
    private var _REF_BASE = DB_BASE
    private var _REF_GOALS = DB_BASE.child("goals")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_GOALS: DatabaseReference {
        return _REF_GOALS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_USER_CURRENT: DatabaseReference {
        let uid = KeychainWrapper.standard.string(forKey: KEY_UID)
        let user = REF_USERS.child(uid!)
        return user
    }
    
    
    
    
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
//
//        //        REF_USERS.child(uid).chil
//        //
//        //        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//        //            // Get user value
//        //            let value = snapshot.value as? NSDictionary
//        //            let username = value?["username"] as? String ?? ""
//        //            let user = User(username: username)
//        //
//        //            // ...
//        //        }) { (error) in
//        //            print(error.localizedDescription)
//        //        }
//        
        REF_USERS.child(uid).updateChildValues(userData)
    }
//
}
