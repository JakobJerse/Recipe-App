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
            
            VStack(alignment: .leading) {
                
                Text("All Recipes")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                ScrollView {
                    // Creating elements as needed
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { recipe in
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
                                        
                                    VStack(alignment: .leading) {
                                        Text(recipe.name)
                                            .font(.headline)
                                        RecipeHighlights(highlights: recipe.highlights)
                                    }
                                    .foregroundColor(.black)
                                    
                                }
                            }

                           
                        }
                        .navigationBarHidden(true)
                    }
                }
            }
            .padding(.leading)
          
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
