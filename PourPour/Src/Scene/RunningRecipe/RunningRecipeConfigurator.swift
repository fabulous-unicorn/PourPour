//
//  RunningRecipeConfigurator.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation
import UIKit


class RunningRecipeConfigurator {

    func configure(view: RunningRecipeController, recipe: RecipeFullEntity) {

//        let router = RunningRecipeRouterImp(view)
//        let presenter = RunningRecipePresenterImp(view, router, recipe)
//        view.presenter = presenter
    }

    static func open(navigationController: UINavigationController, recipe: RecipeFullEntity) {

        let view = R.storyboard.runningRecipe.runningRecipeSceen()!
        //        RunningRecipeConfigurator().configure(view: view, recipe: recipe)
        navigationController.pushViewController(view, animated: true)
    }
}
