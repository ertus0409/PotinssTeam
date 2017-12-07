//
//  ViewGoalVC.swift
//  PotinssTeam
//
//  Created by Guner Babursah on 04/12/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewGoalVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //VARIABLES:
    var goal: Goal!
    var posts = [Post]()
    
    //IBOUTLETS:
    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imagePickerBtn: FancyButton!
    @IBOutlet weak var captionField: FancyField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalName.text = goal.goalName
        
        tableView.delegate = self
        tableView.dataSource = self
        
        observe()

    }
    
    //TABLEVIEW FUNCTIONS:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[((posts.count-1) - indexPath.row)]
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: "textOnly") as? TextOnlyCell {
                cell.configureCell(post: post)
                return cell
            }else {
                return TextOnlyCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //IMAGEPICKER
    @IBAction func imagePickerTapped(_ sender: Any) {
    }
    
    //POST BUTTON
    @IBAction func postBtnTapped(_ sender: Any) {
    }
    
    //OBSERVER:
    func observe() {
        let ref = DataService.ds.REF_POSTS.queryOrdered(byChild: "timestamp")
        ref.observe(.value, with: { (snapshot) in
            self.posts = []
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    print("SNAPP: \(snap)")
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
        })
        
    }
    
    
    //DELETE
    @IBAction func deleteBtnTapped(_ sender: Any) {
        DataService.ds.REF_GOALS.child(goal.goalKey).removeValue()
        self.performSegue(withIdentifier: "back", sender: self)
    }
    

}
