//
//  DataService.swift
//  RecipeApp
//
//  Created by Jakob Jerse on 05/03/2022.
//

import Foundation

class DataService {
    
    // Returns a Recipe Array
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nill, otherwise...
        guard pathString != nil else {
            return [Recipe]() // empty recipe list
        }
        
        // Create an URL object
        let url = URL(fileURLWithPath: pathString!)
        
    
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs for every recipe and for each ingredient in a recipe
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                // error with parsing json
                print(error)
            }
        }
        catch {
            // Error while getting data
            print(error)
        }
        
        return [Recipe]()
    }
    
}
