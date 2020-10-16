//
//  Images.swift
//  Event
//
//  Created by ESSM on 11/18/19.
//  Copyright © 2019 ESSM. All rights reserved.
//

import Foundation
import UIKit
#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias Image = UIImage
var isShowScreen : Bool = false
#elseif os(OSX)
  import AppKit.NSImage
  typealias Image = NSImage
#endif
let DEVICE_ID = (UIDevice.current.identifierForVendor?.uuidString)!
var DeviceToken = ""
enum Asset: String {
  case ArrowUp = "ArrowUp"
  case ArrowDown = "ArrowDown"
  case Banner1 = "Banner1"
  case Banner2 = "Banner2"
  case Banner3 = "Banner3"
  case Banner4 = "Banner4"
  case vegpizza = "vegpizza"
  case onionpizza = "onionpizza"
  case cornpizza = "cornpizza"
  case cheesepizza = "cheesepizza"
  case capsicumpizza = "capsicumpizza"
  case FramHouse = "FramHouse"
  case smashburger = "smashburger"
  case mixvegburger = "mixvegburger"
  case hamburger = "hamburger"
  case grilledsandwich = "grilledsandwich"
  case cheeseburger = "cheeseburger"
  case vanillacake = "vanillacake"
  case sprite = "sprite"
  case mangojuice = "mangojuice"
   case cock = "cock"
  
  
  
 
  
  
  
  var image: Image {
    return Image(asset: self)
  }
}

extension Image {
  convenience init!(asset: Asset) {
    self.init(named: asset.rawValue)
  }
}
internal enum Colors : Int {

    case activeButton = 0xffbf00
    case themeColor = 0x1698E3
    case loadColor = 0xAAAAAA
    case darkGray = 0x797979
    
    func color() -> UIColor {
        return UIColor(netHex: self.rawValue)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
