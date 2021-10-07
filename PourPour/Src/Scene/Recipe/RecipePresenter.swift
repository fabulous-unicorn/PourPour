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
    
    var recipe: RecipeFullEntity?
    let recipeId: Int


    init(_ view: RecipeView, _ router: RecipeRouter) {
        self.view = view
        self.router = router
        
        let recipeId = 0
        self.recipeId = recipeId
    }
    
    func viewDidLoad() {
        self.loadData(for: self.recipeId)
    }

    func loadData(for recipeId: Int) {
        self.recipe = RecipeFullEntity(
            id: 0,
            name: "Колумбия",
            massCoffee: 25.0,
            massWatter: 250,
            temperature: 96,
            time: 200,
            description: "Описание простого рецепта. Возможная дополнительная информация",
            steps: [
                RecipeStepEntity(id: 0, time: 30, massWatter: 50),
                RecipeStepEntity(id: 1, time: 60, massWatter: 50),
                RecipeStepEntity(id: 2, time: 90, massWatter: 50),
                RecipeStepEntity(id: 3, time: 120, massWatter: 50),
                RecipeStepEntity(id: 4, time: 150, massWatter: 50)
                ]
            )
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
        self.router.openRunningRecipe()
    }
    
    func editRecipe() {
        self.router.openEditingRecipe()
    }
}



