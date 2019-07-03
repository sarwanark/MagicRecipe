//
//  ResultCollectionViewCell.swift
//  Magic Recipe
//
//  Created by Sunil Kumar on 02/07/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var recipeName: UILabel!
    @IBOutlet var recipePhoto: UIImageView!
    
    
    
    
    var recipe: RecipeItem! {
        didSet {
            recipeName.text = recipe.name
           // recipePhoto.contentMode = UIViewContentMode.scaleAspectFill
            recipePhoto.clipsToBounds = true
            if recipe.photo != nil {
                recipePhoto.image = recipe.photo
            }
        }
    }
}
