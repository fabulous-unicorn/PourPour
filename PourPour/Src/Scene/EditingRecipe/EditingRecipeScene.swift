//
//  EditingRecipeScene.swift
//  PourPour
//
//  Created by Alesya on 03.11.2021.
//

import SwiftUI

struct EditingRecipeScene: View {
    @ObservedObject private var viewModel: RecipeEntityViewModel
    
    init(_ viewModel: RecipeEntityViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                PourTextField(labelText: "Название рецепта",
                              placeholder: "Колумбия мытой обработки",
                              text: self.$viewModel.name)

                PourEditorText(labelText: "Дополнительная информация",placeholder: "Описание", text: self.$viewModel.description, onCommit: {
                    print("Новое описание: \(self.viewModel.description)")
                })
                RecipeSpecificationsList(massCoffee: self.$viewModel.massCoffee,
                                         massWatter: self.$viewModel.massWatter,
                                         temperature: self.$viewModel.temperature,
                                         duration: self.$viewModel.duration)
                

//                Text("Новое название: \(self.state.recipe.name)")
//                Text("Новое описание: \(self.state.recipe.description)")
                
            }
            .padding(.top, 16.0)
            .padding(.bottom, 24.0)
        }
        .background(Color("surface-primary-bg"))
        .frame(maxWidth: .infinity)
    }
}

#if DEBUG
struct EditingRecipeScene_Previews: PreviewProvider {
    
    static var previews: some View {
        EditingRecipeScene(RecipeEntityViewModel(recipe: RecipeFullEntity(
            id: 4,
            name: "Эфиопия",
            massCoffee: 25.0,
            massWatter: 50,
            temperature: 96,
            duration: 25,
            description: "Описание простого рецепта. Возможная дополнительная информация",
            steps: [
                RecipeStepEntity(id: 0, startTime: 0, massWatter: 10),
                RecipeStepEntity(id: 1, startTime: 5, massWatter: 10),
                RecipeStepEntity(id: 2, startTime: 10, massWatter: 10),
                RecipeStepEntity(id: 3, startTime: 15, massWatter: 10),
                RecipeStepEntity(id: 4, startTime: 20, massWatter: 10)
                ]
            )))
    }
}
#endif
