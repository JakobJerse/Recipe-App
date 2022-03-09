//
//  RecipeFeaturedView.swift
//  RecipeApp
//
//  Created by Jakob Jerse on 07/03/2022.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                
                
            
            GeometryReader { geo in
                // TabView is used for implementig swipable cards
                TabView(selection: $tabSelectionIndex) {
                    
                    // Loop through each recipe
                    ForEach (0..<model.recipes.count) { index in
                        
                        // Only shows those that should be featured
                        if model.recipes[index].featured == true {
                            
                            // Recipe card button
                            Button(action: {
                                
                                // Show the RecipeDetail Sheet
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                    
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                    // Show the recipe detail
                                    RecipeDetailView(recipe: model.recipes[index])
                                }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 60, height: geo.size.height - 100)
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                            
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])

        }
        .onAppear {
            setFeaturedIndex()  // nastavi ustrezen tabSelection index za prvi featured recipe
        }
    }
    
    func setFeaturedIndex() {
        // Find the index of first recipe that is featured
        var index = model.recipes.firstIndex { (recipe) -> Bool in
                return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
