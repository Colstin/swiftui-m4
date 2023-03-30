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

 
 // keep for a second
 

 //1. get the path to the json file
 let pathString = Bundle.main.path(forResource: "data", ofType: "json")
 
 // checks it's not nil
 if let path = pathString {
     //2. Create url object
     let url = URL(filePath: path)
     
     
     //Error Handling basically a try catch
     do{
         //3. create a data object with the data at the url
         let data = try Data(contentsOf: url)
         
         // 4. parse the data
         let decoder = JSONDecoder()
         
         do{
             let recipeData = try decoder.decode([Recipe].self, from: data)
             
             //5. set unique ID's for each instance
             for r in recipeData {
                 r.id = UUID()
             }
             
             self.recipes = recipeData
             
         }catch{
             // Log: Couldn't decode json
             print(error)
         }
         

     } catch{
         // Log: couldn't find the file
         print(error)
     }
 }// Main if to check null
 
 
*/
