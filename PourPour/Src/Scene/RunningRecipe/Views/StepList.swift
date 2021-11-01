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
    
    var body: some View {
        List {
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
        .colorMultiply(Color("surface-secondary-bg"))
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        .onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
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
    }
}
