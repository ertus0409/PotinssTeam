//
//  TeamGoalsVC.swift
//  PotinssTeam
//
//  Created by Guner Babursah on 29/11/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit
import Foundation
import FirebaseAuth
import SwiftKeychainWrapper
import Firebase
import FirebaseDatabase

class TeamGoalsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //IBOUTLETS:
    @IBOutlet weak var tableView: UITableView!
    
    //VARIABLES:
    var goals = [Goal!]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.observe()
    }
    
    
    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ARTH: ID removed from keychain: \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "signOut", sender: nil)
    }
    
    
    //TABLEVIEW FUNCTIONS:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let goal = goals[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell") as? GoalCell {
            cell.configureCell(goal: goal!)
            return cell
        } else {
            return GoalCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //OBSERVER:
    func observe() {
        DataService.ds.REF_GOALS.observe(.value, with: { (snapshot) in
            self.goals = []
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let goalDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let goal = Goal(goalKey: key, goalData: goalDict)
                        self.goals.append(goal)
                    }
                }
            }
            self.tableView.reloadData()
        })

    }
    
    
    
    
    
    
    
    
    
    
    
    

    

}
