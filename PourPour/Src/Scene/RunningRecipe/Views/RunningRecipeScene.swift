//
//  RunningRecipeScene.swift
//  PourPour
//
//  Created by Alesya on 19.10.2021.
//

import SwiftUI

struct RunningRecipeScene: View {
    var recipe: RecipeFullEntity
    @State var currentSecond: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 8.0) {

            RunningRecipeSubhead(numberCurrentStep: 0, massWatter: 50)
            
            ProgressTimerView(
                currentSecond: RunningRecipePresenter.getCurrentTimeForActiveStep(recipe: self.recipe, currentSecond: self.currentSecond),
                duration: RunningRecipePresenter.getDurationActiveStep(recipe: self.recipe, currentSecond: self.currentSecond))

            CommonTime(currentTime: self.currentSecond)
                .padding(.bottom, 8)

            StepList(steps: self.recipe.steps, currentSecond: self.currentSecond)
        }
        .background(Color("surface-primary-bg"))
        .onReceive(timer) { _ in
            withAnimation(.linear(duration: 1)) {
                if self.currentSecond < recipe.duration {
                    self.currentSecond += 1
                }
            }
        }
        .onAppear {
            self.currentSecond = 0
        }
    }
}

struct RunningRecipeScene_Previews: PreviewProvider {
    
    static var previews: some View {
        RunningRecipeScene(recipe: RecipeFullEntity(
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
            ))
    }
}
