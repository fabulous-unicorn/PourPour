//
//  RecipeListRouter.swift
//  PourPour
//
//  Created by Alesya on 06.09.2021.
//

import Foundation

protocol RecipeListRouter {
    func openRecipe(_ index: Int)
    func openInfoSceen()
}

class RecipeListRouterImp: RecipeListRouter {
    
    let view: RecipeListController
    
    init(_ view: RecipeListController) {
        self.view = view
    }
    
    func openRecipe(_ index: Int) {
        RecipeConfigurator.open(navigationController: self.view.navigationController!)
    }
    
    func openInfoSceen() {
        let infoView = R.storyboard.info.infoVC()!
        self.view.navigationController?.pushViewController(infoView, animated: true)
    }
}
