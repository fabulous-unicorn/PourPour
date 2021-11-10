//
//  RecipeFullEntityTests.swift
//  PourPourTests
//
//  Created by Alesya on 02.11.2021.
//

import XCTest
@testable import PourPour

class RecipeFullEntityTests: XCTestCase {
    
    var sut: RecipeFullEntity!

    override func setUpWithError() throws {
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
        sut = recipe
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDurationStep() throws {
        // Given
        let index = 1
        // When
        let duration = sut.getDurationStep(for: index)
        // Then
        XCTAssertEqual(duration, 7, "Продолжительность шага определяется неверно")
    }
    
//    func testFailerGetDurationStep() throws {
//        let index = 7
//        let duration = sut.getDurationStep(for: index)
//        //TODO: Добавить проверку на падение(fatalError) метода
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
