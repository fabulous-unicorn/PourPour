//
//  RecipeListConfigurator.swift
//  PourPour
//
//  Created by Alesya on 06.09.2021.
//

import Foundation
import UIKit


protocol RecipeListConfigurator {
    
    func configure(view: RecipeListController)
}

class RecipeListConfiguratorImp: RecipeListConfigurator {
    
    func configure(view: RecipeListController) {
    
        let router = RecipeListRouterImp(view)
        let gateway = ApiRecipeGateway()
        let presenter = RecipeListPresenterImp(view, router, gateway)
        view.presenter = presenter
    }
}
