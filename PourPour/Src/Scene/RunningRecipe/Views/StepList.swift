//
//  StepList.swift
//  PourPour
//
//  Created by Alesya on 21.10.2021.
//

import SwiftUI

struct StepList: View {
    
    var steps: [RecipeStepEntity]
    var indexActiveStep: Int
    let timeComplited: Int
    
    internal init(steps: [RecipeStepEntity], indexActiveStep: Int, timeComplited: Int) {
        self.steps = steps
        self.indexActiveStep = indexActiveStep
        self.timeComplited = timeComplited
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                StepRow(startTime: step.startTime, massWatter: step.massWatter)
                    .if(index < self.indexActiveStep) {
                        $0.opacity(0.4)
                    }
                }
                if (self.steps.count != 0) {
                    ComplitedStepRow(startTime: self.timeComplited)
                }
            }
        }
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
        timeComplited: 20)
        .previewLayout(.sizeThatFits)
    }
}
