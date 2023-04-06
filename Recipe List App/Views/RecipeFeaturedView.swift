//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 4/1/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectedIndex = 0
    
    
    
    var body: some View {
        
        let featuredRecipes = model.recipes.filter({ $0.featured })
        
        
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
                .fontWeight(.bold)
            
            GeometryReader { geo in
                TabView(selection: $tabSelectedIndex){
                    //Loop through each recipe from the json data
                    ForEach(0..<featuredRecipes.count, id: \.self){ index in

                        //MARK: Recipe Card Button
                        Button{
                            self.isDetailViewShowing = true
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.white)

                                VStack(spacing: 0){
                                    Image(featuredRecipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(featuredRecipes[index].name)
                                        .padding(5)
                                }
                            }
                        }
                        .tag(index)
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB,red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Prep Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(featuredRecipes[tabSelectedIndex].prepTime)
                Text("highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: featuredRecipes[tabSelectedIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
            .sheet(isPresented: $isDetailViewShowing){
            RecipeDetailView(recipe: featuredRecipes[tabSelectedIndex])
        }
            .font(Font.custom("Avenir", size: 15))
        /*.onAppear {
            setFeaturedIndex()
        }*/
    }//body
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
           .environmentObject(RecipeModel())
    }
}
