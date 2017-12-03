//
//  SetGoalVC.swift
//  PotinssTeam
//
//  Created by Guner Babursah on 03/12/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit

class SetGoalVC: UIViewController, UITextFieldDelegate {
    
    //IBOUTLETS:
    @IBOutlet weak var goalNameField: UITextField!
    @IBOutlet weak var dueDateField: UITextField!
    @IBOutlet weak var setGoalBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.goalNameField.delegate = self
        self.dueDateField.delegate = self

        // Do any additional setup after loading the view.
    }


    
    //SetGoal Button:
    @IBAction func setGoalTapped(_ sender: Any) {
        
        let goal: Dictionary<String, AnyObject> = [
        
            "description": goalNameField.text as AnyObject,
            "status": "incomplete" as AnyObject,
            "dueDate": dueDateField.text as AnyObject
        ]

        
        guard let name = goalNameField.text, name != "" else {
            errorLbl.text = "You must enter your goal's name !"
            return
        }
        guard let date = dueDateField.text, date != "" else {
            errorLbl.text = "You must enter a date !"
            return
        }

        
        DataService.ds.REF_GOALS.childByAutoId().setValue(goal)
        performSegue(withIdentifier: "backToTeamGoals", sender: self)
    }
    

    
}
