//
//  RecipeListRouter.swift
//  PourPour
//
//  Created by Alesya on 06.09.2021.
//

import Foundation

protocol RecipeListRouter {
    func openRecipe(_ index: Int)
}

class RecipeListRouterImp: RecipeListRouter {
    
    let view: RecipeListController
    
    init(_ view: RecipeListController) {
        self.view = view
    }
    
    func openRecipe(_ index: Int) {
        //TODO: добавить открытие рецепта
        print("openRecipe")
    }
}
