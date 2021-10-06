//
//  RecipeRouter.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import Foundation

protocol RecipeRouter {
    
    func openRunningRecipe()
    func openEditingRecipe()
}

class RecipeRouterImp: RecipeRouter {
    
    let view: RecipeController
    
    init(_ view: RecipeController) {
        self.view = view
    }
    
    func openRunningRecipe() {
        //TODO: добавить запуск рецепта
        print("openRunningRecipe")
    }
    
    func openEditingRecipe() {
        //TODO: добавить редактирование рецепта
        print("openEditingRecipe")
    }
}
