//
//  TextOnlyCell.swift
//  PotinssTeam
//
//  Created by Guner Babursah on 07/12/2017.
//  Copyright © 2017 Ertugrul Ucar. All rights reserved.
//

import UIKit

class TextOnlyCell: UITableViewCell {
    
    //IBOUTLETS:
    @IBOutlet weak var captionText: UITextView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    
    //VARIABLES:
    var post: Post!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post){
        self.post = post
        
        self.captionText.text = post.postCaption
        self.dateLbl.text = post.postDate
        self.usernameLbl.text = post.postUser
    }

    

}
