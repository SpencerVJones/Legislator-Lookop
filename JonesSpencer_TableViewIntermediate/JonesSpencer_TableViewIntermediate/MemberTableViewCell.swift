//  MemberTableViewCell.swift
//  JonesSpencer_TableViewIntermediate
//  Created by Spencer Jones on 4/20/24.

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    // Cell Outlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var partyStateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
