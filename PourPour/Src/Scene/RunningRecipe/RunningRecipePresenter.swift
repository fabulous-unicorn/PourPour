//
//  RunningRecipePresenter.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation
import Combine

class RunningRecipePresenter {
    //+
    static func getIndexActiveStep(recipe: RecipeFullEntity, currentSecond: Int) -> Int? {
        let indexActiveStep = recipe.steps.enumerated().first { index, step in
            step.startTime <= currentSecond && currentSecond <= step.startTime + recipe.getDurationStep(for: index)
        }?.offset
        
        return indexActiveStep
    }
    
    //+
    static func getActiveStep(recipe: RecipeFullEntity, currentSecond: Int) -> RecipeStepEntity? {
        let activeStep = recipe.steps.enumerated().first { index, step in
            step.startTime <= currentSecond && currentSecond <= step.startTime + recipe.getDurationStep(for: index)
        }?.element
        
        return activeStep
    }
    
    //+
    static func getDurationActiveStep(recipe: RecipeFullEntity, currentSecond: Int) -> Int {
        let activeStepIndex = getIndexActiveStep(recipe: recipe, currentSecond: currentSecond)
        
        guard let activeStepIndex = activeStepIndex else {
            return recipe.duration
        }
        
        return recipe.getDurationStep(for: activeStepIndex)
    }
    
    //+
    static func getCurrentTimeForActiveStep(recipe: RecipeFullEntity, currentSecond: Int) -> Int {
        guard let activeStep = getActiveStep(recipe: recipe, currentSecond: currentSecond) else {
            return recipe.duration
        }
        
        return currentSecond - activeStep.startTime
    }
    
    static func isActiveStep(step: RecipeStepEntity, currentSecond: Int) -> Bool {
        //FIXME: - неверно вычисляется текущий активный шаг
        return step.startTime > currentSecond ? true : false
    }
}
