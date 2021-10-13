//
//  RecipeConfigurator.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import Foundation
import UIKit


class RecipeConfigurator {
    
    func configure(view: RecipeController, recipeId: Int) {
    
        let router = RecipeRouterImp(view)
        let gateway = ApiRecipeGateway()
        let presenter = RecipePresenterImp(view, router, gateway, recipeId)
        view.presenter = presenter
    }
    
    static func open(navigationController: UINavigationController, recipeId: Int) {
        let view = R.storyboard.recipe.recipeVC()!
        RecipeConfigurator().configure(view: view, recipeId: recipeId)
        navigationController.pushViewController(view, animated: true)
    }
}
