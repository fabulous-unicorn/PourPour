//
//  EditingRecipeState.swift
//  PourPour
//
//  Created by Alesya on 08.11.2021.
//

import Foundation

class EditingRecipeState: ObservableObject {
    @Published var recipe: RecipeFullEntity

    init(recipe: RecipeFullEntity) {
        self.recipe = recipe
    }
}
