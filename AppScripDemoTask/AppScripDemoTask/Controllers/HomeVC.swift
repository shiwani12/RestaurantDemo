//
//  HomeVC.swift
//  AppScripDemoTask
//
//  Created by Shiwani manhas on 16/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var dataRestaurant : RestaurantModal!
    var selectedIndx = -1
    var thereIsCellTapped = false
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        //DATE SET
        dataRestaurant = RestaurantModal(resturant: [RestaurantList(name: "Pizza", dishListArr: [DishList(name: "Veg Pizza", image: Asset.vegpizza.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Onion Pizza", image: Asset.onionpizza.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Corn Pizza", image: Asset.cornpizza.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Cheese Pizza", image: Asset.cheesepizza.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Cheese Pizza", image: Asset.capsicumpizza.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Farm House Pizza", image: Asset.FramHouse.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false)]),RestaurantList(name: "Burgers", dishListArr: [DishList(name: "Smash Burger", image: Asset.smashburger.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Mix Veg Burger", image: Asset.mixvegburger.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Hamburger", image: Asset.hamburger.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false)]),RestaurantList(name: "Beverages", dishListArr: [DishList(name: "Coco Cola", image: Asset.cock.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Mix Mango Juice", image: Asset.mangojuice.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Sprite", image: Asset.sprite.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false)]),RestaurantList(name: "Snacks", dishListArr: [DishList(name: "Vanilla Cake", image: Asset.vanillacake.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Cheese Burger", image: Asset.cheeseburger.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false),DishList(name: "Grilled Sandwich", image: Asset.grilledsandwich.image, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isselected: false)])], banner: [BannerList(image: Asset.Banner1.image),BannerList(image: Asset.Banner2.image),BannerList(image: Asset.Banner3.image),BannerList(image: Asset.Banner4.image)])
        // Do any additional setup after loading the view.
    }
    
}

//MARK:- TABLEVIEW DELEGATE
extension HomeVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if dataRestaurant != nil{
            return dataRestaurant.resturant.count + 1
        }else{
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
         if dataRestaurant != nil{
            return dataRestaurant.resturant[section - 1].dishListArr.count
        }else{
            return 0
        }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TVC.BannerTVC, for: indexPath) as! BannerTVC
        cell.cllectionView.delegate = cell
        cell.cllectionView.dataSource = cell
        cell.bannerDta = dataRestaurant.banner
        return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TVC.ListTVC, for: indexPath) as! ListTVC
            if dataRestaurant.resturant[indexPath.section - 1 ].dishListArr[indexPath.row].isselected {
            cell.imgDish.image = dataRestaurant.resturant[indexPath.section - 1 ].dishListArr[indexPath.row].image
            cell.imgDish.addBlurEffect()
            }else{
            cell.imgDish.image = dataRestaurant.resturant[indexPath.section - 1 ].dishListArr[indexPath.row].image
            }
            cell.lblDishname.text = dataRestaurant.resturant[indexPath.section - 1].dishListArr[indexPath.row].name
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        vc.dtaDish = dataRestaurant.resturant[indexPath.section - 1 ].dishListArr[indexPath.row]
        vc.callBackData = {(data) -> () in
        self.dataRestaurant.resturant[indexPath.section - 1 ].dishListArr[indexPath.row].isselected = data
            if let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: indexPath.section)) as? ListTVC{
                if data{
                    cell.imgDish.addBlurEffect()
                }else{
                    cell.imgDish.image = self.dataRestaurant.resturant[indexPath.section - 1 ].dishListArr[indexPath.row].image
                }
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TVC.HeaderTVC) as! HeaderTVC
        cell.lblname.text = dataRestaurant.resturant[section - 1].name
        cell.btnDropDown.tag = section
        cell.btnDropDown.addTarget(self, action: #selector(btnDropDownAct(_:)), for: .touchUpInside)
        return cell
        }else{
            return nil
        }
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return UITableView.automaticDimension
        }else{
        if indexPath.section == selectedIndx && thereIsCellTapped{
            return UITableView.automaticDimension
        }else{
            return 0
        }
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0{
            return 60
        }else{
            return 0
        }
    }
    
}
//MARK:- EXTERNAL FUNCTION
extension HomeVC{
    @objc func btnDropDownAct(_ sender : UIButton){
           if selectedIndx != sender.tag {
               self.thereIsCellTapped = true
               self.selectedIndx = sender.tag
           }
           else {
               // there is no cell selected anymore
               self.thereIsCellTapped = false
               self.selectedIndx = -1
           }
           tblView.reloadData()
       }
}
