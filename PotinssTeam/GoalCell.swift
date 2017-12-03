//
//  GoalCell.swift
//  PotinssTeam
//
//  Created by Guner Babursah on 29/11/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class GoalCell: UITableViewCell {
    
    //IBOUTLETS:
    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var verifedByLbl: UILabel!
    @IBOutlet weak var dueLbl: UILabel!
    
    //VARIABLES:
    var goal: Goal!
    var goalRef: DatabaseReference!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(goal: Goal) {
        
        self.goal = goal
        self.goalName.text = goal.goalName
        self.dueLbl.text = goal.dueDate
//        self.statusLbl.text = goal.goalStatus
        if self.goal.goalStatus == "incomplete" {
            self.statusLbl.text = goal.goalStatus.uppercased()
            self.statusLbl.textColor = UIColor.red
        } else if self.goal.goalStatus == "complete" {
            self.statusLbl.text = goal.goalStatus.uppercased()
        }
        
    }

    @IBAction func verifyBtnTapped(_ sender: Any) {
        
    }
}
