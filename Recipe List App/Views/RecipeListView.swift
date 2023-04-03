//
//  ContentView.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 3/23/23.
//

import SwiftUI

struct RecipeListView: View {
    
    //indicate that we want to listen for any published changes from that object.
    //@ObservedObject var model = RecipeModel()
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
   
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .padding(.top, 40)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes){ r in
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                HStack(spacing: 20.0){
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name)
                                        .foregroundColor(Color.black)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            
        }// nav-view
        
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}

/*
 NavigationView {
     
     List(myArray, id: \.self ){ arrayElement in
         NavigationLink {
             Text("Desination")
         } label: {
             Text(arrayElement)
         }

     }
     .navigationTitle("My List")
     .navigationBarTitleDisplayMode(.large)
 }
 */



/*
NavigationView{
    
    VStack {
        List(model.recipes){ r in
            VStack(alignment: .leading){
                Text(r.name)
                    .font(.title)
                Text(r.cuisine)
            }
        }
        .navigationTitle("My List")
        .navigationBarTitleDisplayMode(.large)
        
        Button("Add Recipe") {
            model.addRecipe()
           
        }
        
    }
}
 */
