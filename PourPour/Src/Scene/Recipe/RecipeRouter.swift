//
//  RecipeRouter.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import Foundation

protocol RecipeRouter {
    
    func openRunningRecipe(with recipe: RecipeFullEntity)
    func openEditingRecipe(with recipe: RecipeFullEntity)
}

class RecipeRouterImp: RecipeRouter {
    
    let view: RecipeController
    
    init(_ view: RecipeController) {
        self.view = view
    }
    
    func openRunningRecipe(with recipe: RecipeFullEntity) {
        RunningRecipeConfigurator.open(navigationController: self.view.navigationController!, recipe: recipe)
    }
    
    func openEditingRecipe(with recipe: RecipeFullEntity) {
        EditingRecipeConfigurator.open(navigationController: self.view.navigationController!, recipe: recipe)
    }
}
