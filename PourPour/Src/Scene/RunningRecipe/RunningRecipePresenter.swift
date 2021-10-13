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
    
    func updateCurrentStep(numberStep: Int, step: RecipeStepEntity?)
    //UpdateScene
}

class RunningRecipePresenterImp: RunningRecipePresenter {
    
    private weak var view: RunningRecipeView!
    private let router: RunningRecipeRouter
    private let recipe: RecipeFullEntity
    
//    var timer: Timer?
    
    init(_ view: RunningRecipeView, _ router: RunningRecipeRouter, _ recipe: RecipeFullEntity) {
        
        self.view = view
        self.router = router
        self.recipe = recipe
    }
    
    func viewDidLoad() {
        self.view.updateCurrentStep(numberStep: 1, step: self.recipe.steps[0])
//        self.timer.timeInterva
//        self.view.updateCurrentStep(numberStep: 6, step: nil)
        
//        self.timer = Timer.scheduledTimer(timeInterval: 0.01, invocation: #selector(timerHasTicked(timer:)), repeats: false)
    }
    
    
    @objc private func timerHasTicked(timer: Timer) {
        
    }
        
//            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self,
//                                         selector: #selector(timerHasTicked(timer:)),
//                                         userInfo: nil, repeats: true)
//            RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
//
//
//
//            /// Record the time at which we started this timer.
//            //checkForOngoingTimer()
//            timerStartTime = Date.timeIntervalSinceReferenceDate
//
//
//
//             timerOriginalStartTime = Date()
//             timerSession = true
//
//
//
//            delegate?.timerHasStarted()
    
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
