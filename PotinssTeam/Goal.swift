//
//  Goal.swift
//  PotinssTeam
//
//  Created by Guner Babursah on 29/11/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

class Goal {
    private var _goalName: String!
    private var _dueDate: String!
    private var _goalStatus: String!
    private var _goalVerifiers: String!
    private var _goalKey: String!
    private var _timeStamp: String!
    private var _goalRef: DatabaseReference!
    
    var goalName: String {
        return _goalName
    }
    var goalStatus: String {
        return _goalStatus
    }
    var goalVerifiers: String {
        return _goalVerifiers
    }
    var goalKey: String {
        return _goalKey
    }
    var dueDate: String {
        return _dueDate
    }
    var timestamp: String {
        return _timeStamp
    }
    
    init(name: String, status: String, verifiers: String) {
        _goalName = name
        _goalStatus = status
        _goalVerifiers = verifiers
    }
    
    init(goalKey: String, goalData: Dictionary<String, AnyObject>) {
        self._goalKey = goalKey
        
        if let name = goalData["description"] as? String{
            self._goalName = name
        }
        if let status = goalData["status"] as? String{
            self._goalStatus = status
        }
        if let verifiers = goalData["verifiers"] as? String {
            self._goalVerifiers = verifiers
        }
        if let dueDate = goalData["dueDate"] as? String {
            self._dueDate = dueDate
        }
        if let timeStamp = goalData["timestamp"] as? String {
            self._timeStamp = timeStamp
        }
        
        _goalRef = DataService.ds.REF_GOALS.child(_goalKey)
        
    }
    
    func adjustVerification(verify: Bool, name: String) {
        if verify {
            _ = DataService.ds.REF_GOALS.child("verifiers").child(name).setValue("true")
        } else {
            _ = DataService.ds.REF_GOALS.child("verifiers").child(name).removeValue()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}
