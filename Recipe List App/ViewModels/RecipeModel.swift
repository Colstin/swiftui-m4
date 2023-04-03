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
    
    func addRecipe(){
 
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
