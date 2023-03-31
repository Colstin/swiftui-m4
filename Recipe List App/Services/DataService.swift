//
//  DataService.swift
//  Recipe List App
//
//  Created by Colstin Donaldson on 3/27/23.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe]{
        
   
        //1. get the path to the json file
        //2. checks it's not nil
        //3. Create url object
        //4. create a data object with the data at the url
        //5. Decode data with JSONDecoder()
        //6. parse the data
        //7. OPIONAL: set unique ID's for each instance ( IF NEEDED)
        
        // #1
        let pathString = Bundle.main.path(forResource: "recipes2", ofType: "json")
        
        // #2
        guard pathString != nil else{
            return [Recipe]()
        }
        // #3
        let url = URL(filePath: pathString!)
        
        
        do {
            // #4
            let data = try Data(contentsOf: url)
            
            // #5
            let decoder = JSONDecoder()
            
            
            do{
                // #6
                let recipeData = try decoder.decode([Recipe].self, from: data)

                // #7
                for r in recipeData{
                    r.id = UUID()
                    
                    //Adding unique ID to ingredients model 
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                //final
                return recipeData
                
            }catch{
                //error parsing json
                print(error)
            }

        } catch{
            // Error getting data
            print(error)
        }
  
        return [Recipe]()
        
    }//func
}
