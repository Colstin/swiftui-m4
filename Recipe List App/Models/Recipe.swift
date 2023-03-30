//
//  Recipe.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 3/24/23.
//

import Foundation

class Recipe:Identifiable, Decodable{
    
    var id:UUID? 
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
    
    
}

// You don't have to include everything just the parts you want
// similar to how SQL chooses stuff it wants. 
