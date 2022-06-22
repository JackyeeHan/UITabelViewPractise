//
//  MyTableViewCell.swift
//  UITabelView練習
//
//  Created by 黃柏瀚 on 2022/3/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
