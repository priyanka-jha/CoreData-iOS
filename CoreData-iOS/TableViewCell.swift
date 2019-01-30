//
//  TableViewCell.swift
//  CoreData-iOS
//
//  Created by Priyanka on 30/01/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelStream: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
