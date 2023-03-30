//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 3/28/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView{
            
            // MARK: Recipe Image
            Image(recipe.image)
                .resizable()
                .frame(height: 200.0, alignment: .center)
                //.scaledToFit()
            
            //MARK: Ingredients
            VStack(alignment: .leading){
                Text("Ingredients")
                    .font(.headline)
                    .padding(.bottom)
                
                ForEach(recipe.ingredients, id: \.self){ item in
                    Text("•" + item)
                }
            }
            
            //MARK: Divider
            Divider()
            
            //MARK: Direction
            VStack(alignment: .leading){
                Text("Directions")
                    .font(.headline)
                    .padding(.vertical, 5)
                
                ForEach(0..<recipe.directions.count, id: \.self){ i in
                    Text(String(i) + ". " + recipe.directions[i])
                        .padding(.bottom, 5)
                    
                }
            }
            .padding(.horizontal)
        }// Scroll View
        .navigationTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[2])
        
    }
}
