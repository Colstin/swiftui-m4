//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 3/28/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
            // MARK: Recipe Image
            Image(recipe.image)
                .resizable()
                .frame(height: 200.0, alignment: .center)
                //.scaledToFit()
                
                Text(recipe.name)
                    .padding(.top, 40)
                    .padding(.leading)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select Your Serving Size:")
                    Picker("", selection: $selectedServingSize){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                
                
                //MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom)
                    
                    ForEach(recipe.ingredients){ item in
                        Text("•" + RecipeModel.getPortion(ingredient: item, recipeServing: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                        
                    }
                }
                .padding()
                
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
                
            }
        }// Scroll View
        .navigationTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
        
    }
}
