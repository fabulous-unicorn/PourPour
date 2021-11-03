//
//  StepList.swift
//  PourPour
//
//  Created by Alesya on 21.10.2021.
//

import SwiftUI

struct StepList: View {
    
    let steps: [RecipeStepEntity]
    let indexActiveStep: Int
    let timeCompleted: Int
    
    internal init(steps: [RecipeStepEntity], indexActiveStep: Int, timeCompleted: Int) {
        self.steps = steps
        self.indexActiveStep = indexActiveStep
        self.timeCompleted = timeCompleted
    }
    
    var body: some View {
        ScrollView(.vertical) {
            if (self.steps.count != 0) {
                VStack {
                    //TODO: Можно добавить автоскрол к активному шагу
                    ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                    StepRow(startTime: step.startTime, massWatter: step.massWatter)
                        .if(index < self.indexActiveStep) {
                            $0.opacity(0.4)
                        }
                    }
                    ComplitedStepRow(startTime: self.timeCompleted)
                }
            } else {
                VStack {
                    //TODO: Настроить центрирование надписи
                    Spacer(minLength: 40)
                    Text("В данном рецепте шаги отсутствуют :(")
                        .font(.system(size: 20)
                                .monospacedDigit())
                        .tracking(0.38)
                        .foregroundColor(Color("text-secondary"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40.0)
//                        .background(Color.red)
                    Spacer(minLength: 40)
                }
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .center)
                .padding(.all, 0.0)
//                .background(Color.green)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("surface-secondary-bg"))
    }
    
}

struct StepList_Previews: PreviewProvider {
    static var previews: some View {
        StepList(steps: [
                    RecipeStepEntity(id: 0, startTime: 0, massWatter: 10),
                    RecipeStepEntity(id: 1, startTime: 5, massWatter: 10),
                    RecipeStepEntity(id: 2, startTime: 10, massWatter: 10),
                    RecipeStepEntity(id: 3, startTime: 15, massWatter: 10),
                    RecipeStepEntity(id: 4, startTime: 20, massWatter: 10)
                ],
                indexActiveStep: 2,
                timeCompleted: 20)
            .previewLayout(.sizeThatFits)

        StepList(steps: [],
                 indexActiveStep: 0,
                 timeCompleted: 0)
            .previewLayout(.sizeThatFits)
    }
}
