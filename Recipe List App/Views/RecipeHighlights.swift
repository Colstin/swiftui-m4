//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 4/5/23.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]){
        
        for i in 0..<highlights.count{
            if i == highlights.count - 1{
                allHighlights += highlights[i]
            } else {
                allHighlights += highlights[i] + ", "
            }
        }
    }
    
    var body: some View {

        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2", "test3"])
    }
}
