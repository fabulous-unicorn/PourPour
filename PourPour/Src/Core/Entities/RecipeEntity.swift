//
//  RecipeEntity.swift
//  PourPour
//
//  Created by Alesya on 06.09.2021.
//

import Foundation

class RecipeEntity {

    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

class RecipeStepEntity {
    
    var id: Int
    var startTime: Int //seconds
    var massWater: Int
    
    init(id: Int, startTime: Int, massWater: Int) {
        self.id = id
        self.startTime = startTime
        self.massWater = massWater
    }
}

class RecipeFullEntity {
    
    var id: Int
    var name: String
    var massCoffee: Double
    var massWater: Int
    var temperature: Int
    var duration: Int //seconds
    var description: String
    var steps: [RecipeStepEntity]

    init(id: Int, name: String, massCoffee: Double, massWater: Int, temperature: Int, duration: Int, description: String, steps: [RecipeStepEntity]) {
        
        self.id = id
        self.name = name
        self.massCoffee = massCoffee
        self.massWater = massWater
        self.temperature = temperature
        self.duration = duration
        self.description = description
        self.steps = steps
    }
   
}

extension RecipeFullEntity {
    
    func getDurationStep(for index: Int) -> Int {
        guard index < self.steps.count else {
            fatalError("Выход за границы массива")
        }
        
        if index == self.steps.count - 1 {
            return self.duration - self.steps[index].startTime
        }
        
        return self.steps[index + 1].startTime - self.steps[index].startTime
    }
}
