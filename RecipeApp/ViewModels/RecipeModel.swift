//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Jakob Jerse on 05/03/2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Get the data
        self.recipes = DataService.getLocalData()
    }
}
