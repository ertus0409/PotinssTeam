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
    @IBOutlet weak var dueLbl: UILabel!
    
    //VARIABLES:
    var goal: Goal!
    var goalRef: DatabaseReference!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configureCell(goal: Goal) {
        
        self.goal = goal
        self.goalName.text = goal.goalName
        self.dueLbl.text = goal.dueDate
        self.statusLbl.text = goal.goalStatus.uppercased()
        
        
    }


}
