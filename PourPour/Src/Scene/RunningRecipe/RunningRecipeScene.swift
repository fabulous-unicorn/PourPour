//
//  RunningRecipeScene.swift
//  PourPour
//
//  Created by Alesya on 19.10.2021.
//

import SwiftUI

let TIME_TIMER_UPDATE = 0.01
fileprivate typealias Presenter = RunningRecipePresenter 

struct RunningRecipeScene: View {
    @State var currentTimerValue: Double = 0
    
    let recipe: RecipeFullEntity
    let timer = Timer.publish(every: TIME_TIMER_UPDATE, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 8.0) {
            //MARK: - RunningRecipeSubhead
            if let activeStep = Presenter.getActiveStep(self.recipe, currentTimerValue: self.currentTimerValue) {
                let numberActiveStep = Presenter.getIndexActiveStep(self.recipe,
                                                                     currentTimerValue: self.currentTimerValue)! + 1
                RunningRecipeSubhead(numberActiveStep: numberActiveStep,
                    massWatter: activeStep.massWatter)
            } else {
                RunningRecipeSubhead()
            }
            //MARK: - ProgressTimerView
            ProgressTimerView(
                currentSecond: Presenter.getCurrentTimeForActiveStep(self.recipe, currentTimerValue: self.currentTimerValue),
                duration: Presenter.getDurationActiveStep(self.recipe, currentTimerValue: self.currentTimerValue))
            //MARK: - CommonTime
            CommonTime(currentTime: Int(self.currentTimerValue))
                .padding(.bottom, 8)
            //MARK: - StepList
            StepList(steps: self.recipe.steps,
                     indexActiveStep: Presenter.getIndexActiveStep(self.recipe, currentTimerValue: self.currentTimerValue) ?? self.recipe.steps.count,
                     timeCompleted: self.recipe.duration)
        }
        .padding(0.0)
        .edgesIgnoringSafeArea([.bottom])
        .background(Color("surface-primary-bg"))
        .onReceive(timer) { _ in
            //MARK: - onReceive(timer)
            let willStepChange = Presenter.willStepChange(self.recipe,
                                                          currentTimerValue: self.currentTimerValue,
                                                          deltaTime: TIME_TIMER_UPDATE)
            let animation: Animation? = !willStepChange ? .linear(duration: TIME_TIMER_UPDATE) : nil
            
            if Int(self.currentTimerValue) < self.recipe.duration {
                withAnimation(animation) {
                    self.currentTimerValue += TIME_TIMER_UPDATE
                }
            }
        }
        .onAppear {
            self.currentTimerValue = 0
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
