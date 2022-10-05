//
//  CategoryTableViewCell.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/05.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
