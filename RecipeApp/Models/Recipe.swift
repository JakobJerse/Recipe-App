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
    var ingredients:[String]
    var directions:[String]
}
