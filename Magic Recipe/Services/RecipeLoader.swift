//
//  RecipeLoader.swift
//  Magic Recipe
//
//  Created by Sunil Kumar on 02/07/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation

class RecipesLoader {
    private var hasMore: Bool
    private var isLoading: Bool = false
    private var page: Int = 1
    private let ingredients: String
    
    init(ingredients: String) {
        self.ingredients = ingredients
        self.hasMore = true
    }
    
    func load(page: Int = 1, completion: @escaping ([RecipeItem], Error?) -> ()) {
        if isLoading {
            return
        }
        //RecipePuppy.recipesForIngredients(ingredients: self.ingredients, page: page, completion: completion)
        
    }
    func loadMore(completion: @escaping ([RecipeItem], Error?) -> ()) {
        page += 1
        load(page: page, completion: completion)
    }
    
    func hasMoreRecipes() -> Bool {
        return hasMore
    }
    
    func setHasMore(hasMore: Bool) {
        self.hasMore = hasMore
    }
    
}
