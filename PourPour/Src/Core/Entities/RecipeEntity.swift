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
    var time: Int //seconds
    var massWatter: Int
    
    init(id: Int, time: Int, massWatter: Int) {
        self.id = id
        self.time = time
        self.massWatter = massWatter
    }
}

class RecipeFullEntity {
    
    var id: Int
    var name: String
    var massCoffee: Double
    var massWatter: Int
    var temperature: Int
    var time: Int //seconds
    var description: String
    var steps: [RecipeStepEntity]

    init(id: Int, name: String, massCoffee: Double, massWatter: Int, temperature: Int, time: Int, description: String, steps: [RecipeStepEntity]) {
        
        self.id = id
        self.name = name
        self.massCoffee = massCoffee
        self.massWatter = massWatter
        self.temperature = temperature
        self.time = time
        self.description = description
        self.steps = steps
    }
   
}
