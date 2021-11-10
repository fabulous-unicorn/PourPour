//
//  RunningRecipeSubhead.swift
//  PourPour
//
//  Created by Alesya on 01.11.2021.
//

import SwiftUI

fileprivate struct StyledText: View {
    let text: String
    
    var body: some View {
        Text(self.text)
            .font(.system(size: 22))
            .fontWeight(.bold)
            .foregroundColor(Color("text-primary"))
            .tracking(0.8)
            .multilineTextAlignment(.center)
            .padding(.top, 24.0)
            .padding(.bottom, 8.0)
    }
}

struct RunningRecipeSubhead: View {
    let numberActiveStep: Int
    let massWater: Int
    let isCompleted: Bool
    
    init(numberActiveStep: Int, massWater: Int) {
        self.numberActiveStep = numberActiveStep
        self.massWater = massWater
        self.isCompleted = false
    }
    
    init() {
        self.numberActiveStep = 0
        self.massWater = 0
        self.isCompleted = true
    }
    
    var body: some View {
        let text = isCompleted ? "Время насладиться кофе" : "\(self.numberActiveStep): Влейте \(self.massWater) гр воды"
        StyledText(text: text)
    }
}

struct RunningRecipeSubhead_Previews: PreviewProvider {
    static var previews: some View {
        RunningRecipeSubhead(numberActiveStep: 2, massWater: 50)
            .previewLayout(.sizeThatFits)
        RunningRecipeSubhead()
            .previewLayout(.sizeThatFits)
    }
}
