//
//  ImageDefaults.swift
//  List_Of_Debtors_Alpha0.2
//
//  Created by ThePsih13 on 19.03.2021.
//  Copyright © 2021 ThePsih13. All rights reserved.
//

import Foundation
import UIKit

class Base {
    
    static let shared = Base()
    let defaults = UserDefaults.standard
    
    struct ImageDefaults: Codable{
        let imagePro: Data?
    }
    
    var imageArrayPro: [ImageDefaults]{
        get{
            if let data = defaults.value(forKey: "image") as? Data{
                return try! PropertyListDecoder().decode([ImageDefaults].self, from: data)
            }else{
                return [ImageDefaults]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "image")
            }
        }
    }
    
    
    func allSave(image: UIImage){
        let data = NSData(data: image.pngData()!)
        let imageDefaults = ImageDefaults(imagePro: data as Data )
        imageArrayPro.insert(imageDefaults, at: 0)
    }
    
    
    struct ColorDefaults: Codable{
        let colorPro: Data?
    }
    
    var colorArrayPro: [ColorDefaults]{
        get{
            if let data = defaults.value(forKey: "color") as? Data{
                return try! PropertyListDecoder().decode([ColorDefaults].self, from: data)
            }else{
                return [ColorDefaults]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "color")
            }
        }
    }
    
    
    func allSaveColor(color: UIColor){
        let data = NSData(data: color.cgColor as! Data)
        let colorDefaults = ColorDefaults(colorPro: data as Data )
        colorArrayPro.insert(colorDefaults, at: 0)
    }
}
