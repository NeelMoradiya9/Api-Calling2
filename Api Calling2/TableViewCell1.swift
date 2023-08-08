//
//  TableViewCell1.swift
//  Api Calling2
//
//  Created by Neel  on 04/08/23.
//

import UIKit

class TableViewCell1: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
