//
//  TableViewCell.swift
//  people
//
//  Created by Mohammed Alsafi on 22/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    func setUsers(users: User){
        nameLabel.text = users.name
    }
    
}
