//
//  DetailVC.swift
//  AppScripDemoTask
//
//  Created by Shiwani manhas on 16/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    //MARK:- INETERNAL FUNCTION
    var dtaDish : DishList!
    var callBackData : ((Bool) -> Void)?
    
    //MARK:- OUTLETS
    @IBOutlet weak var btnSelected: UIButton!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    //MARK:- OVERRIDE FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        if dtaDish != nil{
            lblName.text = dtaDish.name
            imgView.image = dtaDish.image
            txtDescription.text = dtaDish.description
            if dtaDish.isselected == false{
                btnSelected.setTitle("UnSelected", for: .normal)
                
            }else{
                btnSelected.setTitle("Selected", for: .normal)
                
            }
        }
        btnSelected.addTarget(self, action: #selector(btnSelectedAct(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    

}
 //MARK:- EXTERNAL FUNCTION
extension DetailVC{
    @objc func btnSelectedAct(_ sender : UIButton){
        if sender.currentTitle == "Selected"{
            sender.setTitle("UnSelected", for: .normal)
            self.callBackData?(false)
        }else{
            sender.setTitle("Selected", for: .normal)
            self.callBackData?(true)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
