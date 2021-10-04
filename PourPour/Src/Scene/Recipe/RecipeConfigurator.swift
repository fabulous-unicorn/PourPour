//
//  RecipeConfigurator.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import Foundation
import UIKit


protocol RecipeConfigurator {
    
    func configure(view: RecipeController)
}

class RecipeConfiguratorImp: RecipeConfigurator {
    
    func configure(view: RecipeController) {
    
        let router = RecipeRouterImp(view)
        let presenter = RecipePresenterImp(view, router)
        view.presenter = presenter
    }
    
    static func open(navigationController: UINavigationController) {
        let view = R.storyboard.recipeController.recipeVC()!
        RecipeConfiguratorImp().configure(view: view)
        navigationController.pushViewController(view, animated: true)
    }
}
