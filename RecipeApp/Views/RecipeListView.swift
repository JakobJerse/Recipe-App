//
//  ContentView.swift
//  RecipeApp
//
//  Created by Jakob Jerse on 05/03/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { recipe in
                
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    HStack(spacing: 20) {
                        Image(recipe.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(5)
                            
                        Text(recipe.name)
                    }
                }

               
            }
            .navigationTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
