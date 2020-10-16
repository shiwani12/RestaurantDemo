//
//  Extensions.swift
//  Trivia App
//
//  Created by Shiwani manhas on 13/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import Foundation
import UIKit
import CoreImage
class CommonFuncations: NSObject {
static func sendAttString(_ fonts: [UIFont], colors: [UIColor], texts: [String], align : NSTextAlignment) -> NSMutableAttributedString{
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = align
    let attString : NSMutableAttributedString = NSMutableAttributedString(string: "")
    
    for (num,_) in fonts.enumerated(){
        let attributes = [NSAttributedString.Key.font: fonts[num], NSAttributedString.Key.foregroundColor: colors[num]]
        let myAttrString = NSAttributedString(string: texts[num], attributes: attributes)
        attString.append(myAttrString)
    }
    
    attString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attString.length))
    return attString
}
    
}
extension Date {
 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd MMM h:MM a"

        return dateFormatter.string(from: Date())

    }
}
extension UIViewController{
    func alert(message: String, title: String = "")
    {
        let alertController = UIAlertController(title: NSLocalizedString(title, comment: title) , message: NSLocalizedString(message, comment: message), preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
@IBDesignable extension UIView {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
extension UIImageView {

func addBlurEffect(){
       var context = CIContext(options: nil)
       let currentFilter = CIFilter(name: "CIGaussianBlur")
       let beginImage = CIImage(image: self.image!)
       currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
       currentFilter!.setValue(10, forKey: kCIInputRadiusKey)

       let cropFilter = CIFilter(name: "CICrop")
       cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
       cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")

       let output = cropFilter!.outputImage
       let cgimg = context.createCGImage(output!, from: output!.extent)
       let processedImage = UIImage(cgImage: cgimg!)
       self.image = processedImage

}



}
