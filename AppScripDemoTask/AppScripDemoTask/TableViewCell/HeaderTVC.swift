//
//  HeaderTVC.swift
//  AppScripDemoTask
//
//  Created by Shiwani manhas on 16/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import UIKit

class HeaderTVC: UITableViewCell {
    //MARK:- OUTLETS
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var lblname: UILabel!
    //MARK:- Override Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
