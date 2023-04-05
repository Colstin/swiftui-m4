//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 3/24/23.
//

//ViewModel conforms to the ObservableObject protocol so that the View can "observe" it
//and pick up any data changes on its properties marked with @Published.

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
   
    init(){
        // create an instance of dataService and get the data
      // let service = DataService()
      //  self.recipes = service.getLocalData()
        
        // This is using the static function method
        self.recipes = DataService.getLocalData()
        
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServing:Int, targetServings:Int) -> String{
 
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil{
            //Get a single serving size by mult denom by recipe servings
            denominator *= recipeServing
            
            // Get target portion by multiplying num by target servings
            numerator *= targetServings
            
            // Reduct fraction by GCD
            
            let divisor = GCD.greatesCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whle portion if num > denom
            if numerator >= denominator{
                // Calc. whole portions
                wholePortions = numerator / denominator
                // Calc. the remainder
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            // Express the Remainder as a fraction
            if numerator > 0{
                
                portion += wholePortions > 0 ? " ": ""
                portion += "\(numerator)/\(denominator)"
            }
            
            
        }// if
        
        if var unit = ingredient.unit{
                        
            if wholePortions > 1 {
                if unit.suffix(2) == "ch"{
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else{
                    unit += "s"
                }
            }
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "": " "
            
            return portion + unit
        }
        
        return portion
    }
}




/*
 // other way for a dummy data
init(){
    
    recipes.append(Recipe(name: "Spaghetti", cuisine: "Italian"))
    
    recipes.append(Recipe(name: "Sushi", cuisine: "Japanese"))
}

func addRecipe(){
    recipes.append(Recipe(name: "Burger", cuisine: "American"))
}

 
*/
