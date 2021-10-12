//
//  RecipeGateway.swift
//  PourPour
//
//  Created by Alesya on 12.10.2021.
//

import Foundation

class ApiRecipeGateway: RecipeGateway {
    
    func getRecipeList() -> [RecipeEntity] {
        return [RecipeEntity(id: 0, name: "Колумбия \(Int.random(in: 0..<10))"),
                RecipeEntity(id: 1, name: "Коста-Рика \(Int.random(in: 0..<10))"),
                RecipeEntity(id: 2, name: "Бразилия \(Int.random(in: 0..<10))"),
                RecipeEntity(id: 3, name: "Кения \(Int.random(in: 0..<10))"),
                RecipeEntity(id: 4, name: "Эфиопия \(Int.random(in: 0..<10))")]
    }
    
    func getRecipe(id: Int) -> RecipeFullEntity {
        return RecipeFullEntity(
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
    }
    
    
}
