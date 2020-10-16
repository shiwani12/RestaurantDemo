//
//  ListTVC.swift
//  AppScripDemoTask
//
//  Created by Shiwani manhas on 16/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import UIKit

class ListTVC: UITableViewCell {

    @IBOutlet weak var lblDishname: UILabel!
    @IBOutlet weak var imgDish: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
