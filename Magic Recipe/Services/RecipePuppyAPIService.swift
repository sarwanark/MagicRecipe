//
//  RecipePuppyAPIService.swift
//  Magic Recipe
//
//  Created by Sunil Kumar on 02/07/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//
//
//import alomafire
//import SwiftyJSON
//
//public struct RecipePuppy {
//    
//    private static let BASE_URL: String = "http://www.recipepuppy.com/api/" + "&q="
//    
//    static func recipesForIngredients(ingredients: String, page: Int, completion: @escaping ([RecipeItem], Error?) -> ()) {
//        var urlString = BASE_URL + ingredients + "&page=\(page)"
//        urlString = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
//        Alamofire.request(urlString).responseJSON { response in
//            switch response.result {
//            case .success:
//                let result = JSON(response.result.value!)
//                let recipes = JSONParser.parseRecipes(data: result)
//                completion(recipes, nil)
//            case .failure(let error):
//                completion([], error)
//            }
//        }
//    }
//}
