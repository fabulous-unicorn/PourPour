//
//  RunningRecipePresenter.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation

protocol RunningRecipePresenter {
    
    func viewDidLoad()
    func viewDidDisappear()
    func getNumberSteps() -> Int
    func setupRecipeStepCell(_ stepCell: RecipeStepCell, _ index: Int, inActive: Bool)
}

protocol RunningRecipeView: class {
    
    func configure(recipe: RecipeFullEntity)
    func updateCurrentInstruction(currentSecond: Int, stepForView step: RecipeStepForViewEntity)
    func setupCompletedStateScene()
}

class RunningRecipePresenterImp: RunningRecipePresenter {
    
    private weak var view: RunningRecipeView!
    private let router: RunningRecipeRouter
    private let recipe: RecipeFullEntity
    
    private var timer: Timer?
    private var seconds: Int = 0
    private var stepsForView: [RecipeStepForViewEntity]
    
    init(_ view: RunningRecipeView, _ router: RunningRecipeRouter, _ recipe: RecipeFullEntity) {
        
        self.view = view
        self.router = router
        self.recipe = recipe
        self.stepsForView =  RecipeStepForViewEntity.getStepsForView(recipe: recipe)
    }
    
    func viewDidLoad() {
        self.view.configure(recipe: self.recipe)
        
        if self.stepsForView.count == 0 {
            
            self.view.setupCompletedStateScene()
        } else {
            
            self.view.updateCurrentInstruction(currentSecond: self.seconds, stepForView: self.stepsForView[0] )
            
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
            RunLoop.current.add(self.timer!, forMode: .common)
        }
    }
    
    func viewDidDisappear() {
        self.timer?.invalidate()
    }
    
    @objc func fireTimer() {
        self.seconds += 1
      
        if self.seconds > self.recipe.time {
            self.timer?.invalidate()
            self.view.setupCompletedStateScene()
            return
        }
        
        self.stepsForView.forEach { step in
            if step.startSecond <= self.seconds  && self.seconds < step.lastSecond {
                self.view.updateCurrentInstruction(currentSecond: self.seconds, stepForView: step)
            }
        }
        //TODO: выпилить принт после изучения возможных утечек
        print("Seconds: \(seconds)")
    }
    
    func getNameScreen() -> String {
        return self.recipe.name
    }
    
    func getNumberSteps() -> Int {
        return self.recipe.steps.count
    }
    
    func setupRecipeStepCell(_ stepCell: RecipeStepCell, _ index: Int, inActive: Bool) {

        if index == self.recipe.steps.count {
            stepCell.setupCompletedCell(time: self.recipe.time)
        } else {
            stepCell.setup(self.recipe.steps[index], inActive: inActive)
        }
    }
}

class RecipeStepForViewEntity {
    
    let numberStep: Int
    let startSecond: Int
    let lastSecond : Int
    let massWatter: Int
    
    internal init(numberStep: Int, startSecond: Int, lastSecond: Int, massWatter: Int) {
        self.numberStep = numberStep
        self.startSecond = startSecond
        self.lastSecond = lastSecond
        self.massWatter = massWatter
    }
    
    static func getStepsForView(recipe: RecipeFullEntity) -> [RecipeStepForViewEntity] {
        
        guard recipe.steps.count != 0 else {
            return []
        }
        
        return recipe.steps.enumerated().map{ index, step  in
            
            if index + 1 == recipe.steps.count {
                return RecipeStepForViewEntity(numberStep: index, startSecond: step.time, lastSecond: recipe.time, massWatter: step.massWatter)
            } else {
                return RecipeStepForViewEntity(numberStep: index, startSecond: step.time, lastSecond: recipe.steps[index + 1].time, massWatter: step.massWatter)
            }
        }
    }
}
