//
//  RecipeGateway.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation

class ApiRecipeGateway: RecipeGateway {
    
    func getRecipeList() -> [RecipeEntity] {
        
        return [RecipeEntity(id: 0, name: "Колумбия (5)"),
                RecipeEntity(id: 1, name: "Коста-Рика (1)"),
                RecipeEntity(id: 2, name: "Бразилия (2)"),
                RecipeEntity(id: 3, name: "Кения (0)"),
                RecipeEntity(id: 4, name: "Эфиопия (5 fast)")]
//        return [RecipeEntity(id: 0, name: "Колумбия \(Int.random(in: 0..<10))"),
//                RecipeEntity(id: 1, name: "Коста-Рика \(Int.random(in: 0..<10))"),
//                RecipeEntity(id: 2, name: "Бразилия \(Int.random(in: 0..<10))"),
//                RecipeEntity(id: 3, name: "Кения \(Int.random(in: 0..<10))"),
//                RecipeEntity(id: 4, name: "Эфиопия \(Int.random(in: 0..<10))")]
    }
    
    func getRecipe(id: Int) -> RecipeFullEntity {
        
        switch id {
        case 0:
            return RecipeFullEntity(
                id: 0,
                name: "Колумбия",
                massCoffee: 25.0,
                massWater: 250,
                temperature: 96,
                duration: 150,
                description: "Описание простого рецепта. Возможная дополнительная информация",
                steps: [
                    RecipeStepEntity(id: 0, startTime: 0, massWater: 50),
                    RecipeStepEntity(id: 1, startTime: 30, massWater: 50),
                    RecipeStepEntity(id: 2, startTime: 60, massWater: 50),
                    RecipeStepEntity(id: 3, startTime: 90, massWater: 50),
                    RecipeStepEntity(id: 4, startTime: 120, massWater: 50)
                    ]
                )
        case 1:
            return RecipeFullEntity(
                id: 1,
                name: "Коста-Рика",
                massCoffee: 25.5,
                massWater: 200,
                temperature: 96,
                duration: 10,
                description: "Описание простого рецепта. Возможная дополнительная информация",
                steps: [
                    RecipeStepEntity(id: 0, startTime: 0, massWater: 50)
                ]
            )
        case 2:
            return RecipeFullEntity(
                id: 2,
                name: "Бразилия",
                massCoffee: 5,
                massWater: 10,
                temperature: 96,
                duration: 10,
                description: "Описание простого рецепта. Возможная дополнительная информация",
                steps: [
                    RecipeStepEntity(id: 0, startTime: 0, massWater: 50),
                    RecipeStepEntity(id: 1, startTime: 5, massWater: 50)
                ]
            )
        case 3:
            return RecipeFullEntity(
                id: 3,
                name: "Кения",
                massCoffee: 25.5,
                massWater: 0,
                temperature: 91,
                duration: 0,
                description: "Описание простого рецепта. Возможная дополнительная информация",
                steps: []
            )
        case 4:
            return RecipeFullEntity(
                id: 4,
                name: "Эфиопия",
                massCoffee: 25.0,
                massWater: 50,
                temperature: 96,
                duration: 25,
                description: "Описание простого рецепта. Возможная дополнительная информация",
                steps: [
                    RecipeStepEntity(id: 0, startTime: 0, massWater: 10),
                    RecipeStepEntity(id: 1, startTime: 5, massWater: 10),
                    RecipeStepEntity(id: 2, startTime: 10, massWater: 10),
                    RecipeStepEntity(id: 3, startTime: 15, massWater: 10),
                    RecipeStepEntity(id: 4, startTime: 20, massWater: 10)
                    ]
                )
        default:
            return RecipeFullEntity(
                id: id,
                name: "--",
                massCoffee: 25.0,
                massWater: 250,
                temperature: 96,
                duration: 150,
                description: "-------",
                steps: [
                    RecipeStepEntity(id: 0, startTime: 0, massWater: 50),
                    RecipeStepEntity(id: 1, startTime: 30, massWater: 50),
                    RecipeStepEntity(id: 2, startTime: 60, massWater: 50),
                    RecipeStepEntity(id: 3, startTime: 90, massWater: 50),
                    RecipeStepEntity(id: 4, startTime: 120, massWater: 50)
                    ]
                )
        }
        
    }
    
    
}
