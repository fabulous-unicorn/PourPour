//
//  RecipeGateway.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation

protocol RecipeGateway {
    
    
    func getRecipeList() -> [RecipeEntity]
    
    func getRecipe(id: Int) -> RecipeFullEntity
    
}
