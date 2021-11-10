//
//  EditingRecipeState.swift
//  PourPour
//
//  Created by Alesya on 08.11.2021.
//

import Foundation

//class EditingRecipeState: ObservableObject {
//    @Published var recipe: RecipeFullEntity
//
//    init(recipe: RecipeFullEntity) {
//        self.recipe = recipe
//    }
//}

class RecipeEntityViewModel: ObservableObject {
    var id: Int
    @Published var name: String
    @Published var massCoffee: String
    @Published var massWatter: String
    @Published var temperature: String
    @Published var duration: String
    @Published var description: String
    
    @Published var steps: [RecipeStepEntity]
    
    init(recipe: RecipeFullEntity) {
        self.id = recipe.id
        self.name = recipe.name
        self.massCoffee = "\(recipe.massCoffee)"
        self.massWatter = "\(recipe.massWatter)"
        self.temperature = "\(recipe.temperature)"
        self.duration = TimeFormater.formMinutesTimerString(from: recipe.duration)
        self.steps = recipe.steps
        self.description = recipe.description
    }
    
//    func createRecipeFullEntity() -> RecipeFullEntity {
//
//    }
}
