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
        let presenter = RecipeListPresenterImp(view, router)
        view.presenter = presenter
    }
}
