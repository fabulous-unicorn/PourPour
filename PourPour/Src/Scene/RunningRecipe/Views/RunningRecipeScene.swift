//
//  RunningRecipeScene.swift
//  PourPour
//
//  Created by Alesya on 19.10.2021.
//

import SwiftUI


struct CommonTime: View {
    var currentTime: Int
    
    var body: some View {
        Group {
            HStack {
                Text("Общее время")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(Color("text-secondary"))
                    .frame(height:24)
                Spacer()
                Text(TimeFormaterr.formMinutesTimerString(from: currentTime))
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color("text-primary"))
                    .frame(height: 28.0)
                    .padding(/*@START_MENU_TOKEN@*/.vertical, 12.0/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal, 16.0)
            .background(Color("surface-secondary-bg"))
        }
    }
}


struct RunningRecipeScene: View {
    var recipe: RecipeFullEntity
    @State var currentSecond: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 8.0) {
            
            Text("Шаг []: Влейте [] гр вода")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(Color("text-primary"))
                .tracking(0.8)
                .multilineTextAlignment(.center)
                .padding(.top, 24.0)
                .padding(.bottom, 8.0)
        
            ProgressTimerView(
                currentSecond: self.currentSecond,
                lastSecond: RunningRecipePresenter.getLastSecondCurrentStep(recipe: self.recipe, currentSecond: self.currentSecond))
            CommonTime(currentTime: self.currentSecond)
                .padding(.bottom, 8)

            StepList(steps: self.recipe.steps, currentSecond: self.currentSecond)
        }
        .onReceive(timer) { _ in
            if self.currentSecond < recipe.duration {
                self.currentSecond += 1
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
