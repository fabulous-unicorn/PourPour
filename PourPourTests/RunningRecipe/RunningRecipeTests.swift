//
//  RunningRecipeTests.swift
//  PourPourTests
//
//  Created by Alesya on 02.11.2021.
//

import XCTest
@testable import PourPour

class RunningRecipePresenterTests: XCTestCase {

    //System Under Test
    let recipe = RecipeFullEntity(
        id: 4,
        name: "Эфиопия",
        massCoffee: 25.0,
        massWater: 50,
        temperature: 96,
        duration: 25,
        description: "Описание простого рецепта. Возможная дополнительная информация",
        steps: [
            RecipeStepEntity(id: 0, startTime: 0, massWater: 10),      //duration = 5
            RecipeStepEntity(id: 1, startTime: 5, massWater: 10),      //duration = 7
            RecipeStepEntity(id: 2, startTime: 12, massWater: 10),     //duration = 4
            RecipeStepEntity(id: 3, startTime: 16, massWater: 10),     //duration = 5
            RecipeStepEntity(id: 4, startTime: 21, massWater: 10)      //duration = 4
            ]
        )
    
    func testGetIndexActiveStep() throws {
        // Given
        let currentSecond: Double = 5
        // When
        let indexActiveStep = RunningRecipePresenter.getIndexActiveStep(recipe, currentTimerValue: currentSecond)
        // Then
        XCTAssertEqual(indexActiveStep, 1, "Индекс активного шага определяется неверно")
    }
    
    func testGetActiveStep() throws {
        let currentSecond: Double = 6
        let activeStep = RunningRecipePresenter.getActiveStep(recipe, currentTimerValue: Double(currentSecond))
        XCTAssertEqual(activeStep?.id, self.recipe.steps[1].id, "Активный шаг определяется неверно")
    }

    func testGetDurationActiveStep() throws {
        let currentSecond: Double = 6
        let duration = RunningRecipePresenter.getDurationActiveStep(recipe, currentTimerValue: currentSecond)
        XCTAssertEqual(duration, 7, "Продолжительность активного шага определяется неверно")
    }
    
    func testGetDurationActiveStepForLastStep() throws {
        let currentSecond: Double = 22
        let duration = RunningRecipePresenter.getDurationActiveStep(recipe, currentTimerValue: currentSecond)
        XCTAssertEqual(duration, 4, "Продолжительность активного шага(при условии, что он является последним) определяется неверно")
    }

    func testGetCurrentTimeForActiveStep() throws {
        let currentSecond = 6.13
        let currentTime = RunningRecipePresenter.getCurrentTimeForActiveStep(recipe, currentTimerValue: currentSecond)
        XCTAssertEqual(currentTime, 1.13, "Время для активного шага определяется неверно")
    }
}
