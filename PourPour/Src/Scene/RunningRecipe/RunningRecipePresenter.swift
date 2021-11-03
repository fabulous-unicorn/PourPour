//
//  RunningRecipePresenter.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation
import Combine

class RunningRecipePresenter {

    static func getIndexActiveStep(_ recipe: RecipeFullEntity, currentTimerValue: Double) -> Int? {
        let currentTimerValue = Int(currentTimerValue)
        let indexActiveStep = recipe.steps.enumerated().first { index, step in
            step.startTime <= currentTimerValue && currentTimerValue < step.startTime + recipe.getDurationStep(for: index)
        }?.offset

        return indexActiveStep
    }
    
    static func getActiveStep(_ recipe: RecipeFullEntity, currentTimerValue: Double) -> RecipeStepEntity? {
        let currentTimerValue = Int(currentTimerValue)
        let activeStep = recipe.steps.enumerated().first { index, step in
            step.startTime <= currentTimerValue && currentTimerValue < step.startTime + recipe.getDurationStep(for: index)
        }?.element
        
        return activeStep
    }
    
    static func getDurationActiveStep(_ recipe: RecipeFullEntity, currentTimerValue: Double) -> Int {
        let activeStepIndex = getIndexActiveStep(recipe, currentTimerValue: currentTimerValue)
        
        guard let activeStepIndex = activeStepIndex else {
            return recipe.duration
        }
        
        return recipe.getDurationStep(for: activeStepIndex)
    }
    
    static func getCurrentTimeForActiveStep(_ recipe: RecipeFullEntity, currentTimerValue: Double) -> Double {
        guard let activeStep = getActiveStep(recipe, currentTimerValue: currentTimerValue) else {
            return Double(recipe.duration)
        }
        
        return currentTimerValue - Double(activeStep.startTime)
    }
    
    static func willStepChange(_ recipe: RecipeFullEntity, currentTimerValue: Double, deltaTime: Double) -> Bool {
        let activeStep = getActiveStep(recipe, currentTimerValue: currentTimerValue)
        let nextActiveStep = getActiveStep(recipe, currentTimerValue: currentTimerValue + deltaTime)
        
        return activeStep?.id != nextActiveStep?.id
    }
}
