//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 4/1/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
       Text("Featured View")
  
    }//body
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
           .environmentObject(RecipeModel())
    }
}
