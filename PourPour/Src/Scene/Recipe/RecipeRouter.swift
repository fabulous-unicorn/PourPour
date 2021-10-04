//
//  RecipeRouter.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import Foundation

protocol RecipeRouter {
    func startRecipe()
    func editRecipe()
}

class RecipeRouterImp: RecipeRouter {
    
    let view: RecipeController
    
    init(_ view: RecipeController) {
        self.view = view
    }
    
    func startRecipe() {
        //TODO: добавить запуск рецепта
    }
    
    func editRecipe() {
        //TODO: добавить редактирование рецепта
    }
}
