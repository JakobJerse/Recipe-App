//
//  Recipe.swift
//  RecipeApp
//
//  Created by Jakob Jerse on 05/03/2022.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    // You dont need to include all the properties from JSON file
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
    
}

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?        // Not all of the ingredients have this property
    var denom:Int?      // Not all of the ingredients have this property
    var unit:String?    // Not all of the ingredients have this property
    
}
