//
//  RunningRecipePresenter.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation
import Combine

class RunningRecipePresenter {
    
    static func getLastSecondCurrentStep(recipe: RecipeFullEntity, currentSecond: Int) -> Int {
         //TODO
        let activeStepIndex = recipe.steps.firstIndex { currentSecond <= $0.startTime }
        
        guard let activeStepIndex = activeStepIndex else {
            return recipe.duration
        }
        
        return recipe.steps[activeStepIndex].startTime - 1
    }
    
    static func isActiveStep(step: RecipeStepEntity, currentSecond: Int) -> Bool {
        //FIXME: - неверно вычисляется текущий активный шаг
        return step.startTime > currentSecond ? true : false
    }
    
    static func getActiveStep(recipe: RecipeFullEntity, currentSecond: Int) -> RecipeStepEntity? {
        let activeStep = recipe.steps.enumerated().first { index, step in
            step.startTime < currentSecond && currentSecond <= recipe.getLastSecondStep(for: index)
        }?.element
        
        return activeStep
    }
    
    static func getIndexCurrentStep(recipe: RecipeFullEntity, currentSecond: Int) -> Int? {
        let indexActiveStep = recipe.steps.enumerated().first { index, step in
            step.startTime < currentSecond && currentSecond <= recipe.getLastSecondStep(for: index)
        }?.offset
        
        return indexActiveStep
    }
    
}
