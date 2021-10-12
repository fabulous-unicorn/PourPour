//
//  RunningRecipePresenter.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation

protocol RunningRecipePresenter {
    
    func viewDidLoad()
}

protocol RunningRecipeView: class {
    
}

class RunningRecipePresenterImp: RunningRecipePresenter {
    
    private weak var view: RunningRecipeView!
    private let router: RunningRecipeRouter
    private let recipe: RecipeFullEntity
    
    
    init(_ view: RunningRecipeView, _ router: RunningRecipeRouter, _ recipe: RecipeFullEntity) {
        
        self.view = view
        self.router = router
        self.recipe = recipe
    }
    
    func viewDidLoad() {
        print("")
    }
}
