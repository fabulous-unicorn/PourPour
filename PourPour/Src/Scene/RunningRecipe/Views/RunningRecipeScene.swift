//
//  RunningRecipeScene.swift
//  PourPour
//
//  Created by Alesya on 19.10.2021.
//

import SwiftUI

let TIME_TIMER_UPDATE = 0.01

struct RunningRecipeScene: View {
    @State var currentSecond: Double = 0
    
    let recipe: RecipeFullEntity
    let timer = Timer.publish(every: TIME_TIMER_UPDATE, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 8.0) {
            //MARK: - RunningRecipeSubhead
            if let activeStep = RunningRecipePresenter.getActiveStep(recipe: self.recipe, currentSecond: Int(self.currentSecond)) {
                RunningRecipeSubhead(numberCurrentStep: RunningRecipePresenter.getIndexActiveStep(recipe: recipe,
                                                              currentSecond: Int(self.currentSecond))! + 1,
                    massWatter: activeStep.massWatter)
            } else {
                RunningRecipeSubhead()
            }
            //MARK: - ProgressTimerView
            ProgressTimerView(
                currentSecond: RunningRecipePresenter.getCurrentTimeForActiveStep(recipe: self.recipe, currentSecond: self.currentSecond),
                duration: RunningRecipePresenter.getDurationActiveStep(recipe: self.recipe, currentSecond: Int(self.currentSecond)))
            //MARK: - CommonTime
            CommonTime(currentTime: Int(self.currentSecond))
                .padding(.bottom, 8)
            //MARK: - StepList
            StepList(steps: self.recipe.steps,
                     indexActiveStep: RunningRecipePresenter.getIndexActiveStep(recipe: self.recipe, currentSecond: Int(self.currentSecond)) ?? self.recipe.steps.count,
                     timeComplited: self.recipe.duration)
        }
        .padding(0.0)
        .edgesIgnoringSafeArea([.bottom])
        .background(Color("surface-primary-bg"))
        .onReceive(timer) { _ in
            //MARK: - onReceive(timer)
            let willStepChange = RunningRecipePresenter.willStepChange(recipe: self.recipe,
                                                                       currentSecond: self.currentSecond,
                                                                       delta: TIME_TIMER_UPDATE)
            let animation: Animation? = !willStepChange ? .linear(duration: TIME_TIMER_UPDATE) : nil
            
            if Int(self.currentSecond) < recipe.duration {
                withAnimation(animation) {
                    self.currentSecond += TIME_TIMER_UPDATE
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
