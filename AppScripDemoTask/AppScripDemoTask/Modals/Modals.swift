//
//  Modals.swift
//  AppScripDemoTask
//
//  Created by Shiwani manhas on 16/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import Foundation
import UIKit
struct RestaurantModal: Codable {
    var resturant : [RestaurantList]
    var banner : [BannerList]

}
struct BannerList: Codable {
    
    public var image: UIImage

    init(image: UIImage) {
        self.image = image
    }

    enum CodingKeys: String, CodingKey {
        case name, checkedStatus, link, price, note, image
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.decode(Data.self, forKey: .image)
        guard let image = UIImage(data: data) else {
            throw DecodingError.dataCorruptedError(forKey: .image, in: values, debugDescription: "Invalid image data")
        }
        self.image = image
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(image.pngData(), forKey: .image)
    }
}

struct RestaurantList : Codable{
    var name : String
    var dishListArr : [DishList]
}
struct DishList : Codable{
    var name : String
    var description : String
    var image : UIImage
    var isselected : Bool
    enum CodingKeys: String, CodingKey {
        case name, image, description, isselected
    }

    init(name: String, image: UIImage, description : String, isselected : Bool) {
        self.name = name
        self.image = image
        self.description = description
        self.isselected = isselected
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        isselected = try values.decode(Bool.self, forKey: .isselected)
        let data = try values.decode(Data.self, forKey: .image)
        guard let image = UIImage(data: data) else {
            throw DecodingError.dataCorruptedError(forKey: .image, in: values, debugDescription: "Invalid image data")
        }
        self.image = image
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(isselected, forKey: .isselected)
        try container.encode(image.pngData(), forKey: .image)
    }
}
