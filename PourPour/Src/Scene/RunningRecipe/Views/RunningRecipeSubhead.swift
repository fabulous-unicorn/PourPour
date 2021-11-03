//
//  RunningRecipeSubhead.swift
//  PourPour
//
//  Created by Alesya on 01.11.2021.
//

import SwiftUI

struct RunningRecipeSubhead: View {
    let numberCurrentStep: Int
    let massWatter: Int
    let isComplited: Bool
    
    init(numberCurrentStep: Int, massWatter: Int) {
        self.numberCurrentStep = numberCurrentStep
        self.massWatter = massWatter
        self.isComplited = false
    }
    
    init() {
        self.numberCurrentStep = 0
        self.massWatter = 0
        self.isComplited = true
    }
    
    var body: some View {
        if isComplited {
            Text("Время насладиться кофе")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(Color("text-primary"))
                .tracking(0.8)
                .multilineTextAlignment(.center)
                .padding(.top, 24.0)
                .padding(.bottom, 8.0)
        } else {
            Text("Шаг \(self.numberCurrentStep): Влейте \(self.massWatter) гр воды")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(Color("text-primary"))
                .tracking(0.8)
                .multilineTextAlignment(.center)
                .padding(.top, 24.0)
                .padding(.bottom, 8.0)
        }
    }
}

struct RunningRecipeSubhead_Previews: PreviewProvider {
    static var previews: some View {
        RunningRecipeSubhead(numberCurrentStep: 2, massWatter: 50)
            .previewLayout(.sizeThatFits)
        RunningRecipeSubhead()
            .previewLayout(.sizeThatFits)
    }
}
