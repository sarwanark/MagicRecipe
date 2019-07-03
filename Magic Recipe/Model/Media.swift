//
//  Media.swift
//  Magic Recipe
//
//  Created by Sunil Kumar on 01/07/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import UIKit

let RecipeOpenCountKey = "recipeOpenCount"

class RecipeItem: NSObject {
    var name: String
    var photo: UIImage?
    var url: String
    var photoUrl: String?
    
    let nameKey = "name"
    let photoKey = "photo"
    let urlKey = "url"
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        aCoder.encode(name, forKey: nameKey)
        if let thePhoto = photo {
            aCoder.encode(thePhoto, forKey: photoKey)
        }
        aCoder.encode(url, forKey: urlKey)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: nameKey) as! String
        photo = aDecoder.decodeObject(forKey: photoKey) as? UIImage
        url = aDecoder.decodeObject(forKey: urlKey) as! String
    }
    
    init(name: String, photo: UIImage?, url: String) {
        self.name = name
        self.photo = photo
        self.url = url
    }
    
    init(name: String, photoUrl: String?, photo: UIImage?, url: String) {
        self.name = name
        self.photoUrl = photoUrl
        self.photo = photo
        self.url = url
}
}
