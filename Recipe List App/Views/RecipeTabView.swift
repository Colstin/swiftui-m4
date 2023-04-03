//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 3/30/23.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {

        TabView{
            RecipeFeaturedView()
                .tabItem{
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }//tabview
        .environmentObject(RecipeModel())
    }//body
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}

//MARK: Environment object
/*
    1. we can put the environment object in the main start file up to you.  This will allow all children files to access This viewModel data init.
    2. MAKE SURE TO PUT .environmentObject(RecipeModel()) in the previews section in order to see the app, technically you dont need to do this but the app will keep crashing in the preview window. 

*/
