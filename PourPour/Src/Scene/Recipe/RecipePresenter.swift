//
//  RecipePresenter.swift
//  PourPour
//
//  Created by Alesya on 04.10.2021.
//

import Foundation

protocol RecipePresenter {
    
    func viewDidLoad()
    func startRecipe()
    func editRecipe()
    func getNumberSteps() -> Int
    func setupRecipeStepCell(_ stepCell: RecipeStepCell, _ index: Int)
}


protocol RecipeView: class {
    
    func configure(with recipe: RecipeFullEntity)
}


class RecipePresenterImp: RecipePresenter {

    private weak var view: RecipeView!
    private let router: RecipeRouter
    private let gateway: RecipeGateway
    
    var recipe: RecipeFullEntity?
    let recipeId: Int


    init(_ view: RecipeView, _ router: RecipeRouter, _ gateway: RecipeGateway) {
        self.view = view
        self.router = router
        self.gateway = gateway
        
        let recipeId = 0
        self.recipeId = recipeId
    }
    
    func viewDidLoad() {
        self.loadData(for: self.recipeId)
    }

    func loadData(for recipeId: Int) {
        self.recipe = self.gateway.getRecipe(id: recipeId)
        
        if let recipe = self.recipe {
            self.view.configure(with: recipe)
        }
    }
    
    func getNumberSteps() -> Int {
        return self.recipe?.steps.count ?? 0
    }
    
    func setupRecipeStepCell(_ stepCell: RecipeStepCell, _ index: Int) {
        guard let stepEntity = self.recipe?.steps[index] else {
            print("Запрос на не существующую ячейку")
            return
        }
        
        stepCell.setup(stepEntity)
    }
    
    func startRecipe() {
        
        guard let recipe = self.recipe else {
            return
        }
        
        self.router.openRunningRecipe(with: recipe)
    }
    
    func editRecipe() {
        self.router.openEditingRecipe()
    }
}
