//
//  StepList.swift
//  PourPour
//
//  Created by Alesya on 21.10.2021.
//

import SwiftUI

struct StepList: View {
    var steps: [RecipeStepEntity]
    var currentSecond: Int
    
    var body: some View {
        //TODO: нехватает шага завершения
        List(steps, id: \.id) { step in
            StepRow(startTime: step.startTime, massWatter: step.massWatter)
                .if(!RunningRecipePresenter.isActiveStep(step: step,
                                                        currentSecond: self.currentSecond)) {
                    $0.opacity(0.4)
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
            ], currentSecond: 7)
    }
}
