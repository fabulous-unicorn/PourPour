//
//  RunningRecipePresenter.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation

protocol RunningRecipePresenter {
    
    func viewDidLoad()
    func getNumberSteps() -> Int
    func getNameScreen() -> String
    func setupRecipeStepCell(_ stepCell: RecipeStepCell, _ index: Int)
}

protocol RunningRecipeView: class {
    
    func updateCurrentStep(with step: RecipeStepEntity)
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
        self.view.updateCurrentStep(with: self.recipe.steps[0])
    }
    
    func getNameScreen() -> String {
        return self.recipe.name
    }
    
    func getNumberSteps() -> Int {
        return self.recipe.steps.count
    }
    
    func setupRecipeStepCell(_ stepCell: RecipeStepCell, _ index: Int) {

        if index == self.recipe.steps.count {
            stepCell.setupCompletedCell(time: self.recipe.time)
        } else {
            stepCell.setup(self.recipe.steps[index])
        }
    }
}
