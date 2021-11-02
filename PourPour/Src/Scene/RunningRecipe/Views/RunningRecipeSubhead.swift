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
    
    init(numberCurrentStep: Int = 0, massWatter: Int = 0, isComplited: Bool = false) {
        self.numberCurrentStep = numberCurrentStep
        self.massWatter = massWatter
        self.isComplited = isComplited
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
        RunningRecipeSubhead(isComplited: true)
            .previewLayout(.sizeThatFits)
    }
}
