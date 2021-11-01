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
        
        let activeStepIndex = recipe.steps.firstIndex { currentSecond <= $0.startTime }
        
        guard let activeStepIndex = activeStepIndex else {
            return recipe.duration
        }
        
        return recipe.steps[activeStepIndex].startTime
    }
    
    static func isActiveStep(step: RecipeStepEntity, currentSecond: Int) -> Bool {
        //FIXME: - неверно вычисляется текущий активный шаг
        return step.startTime > currentSecond ? true : false
    }
    
}
