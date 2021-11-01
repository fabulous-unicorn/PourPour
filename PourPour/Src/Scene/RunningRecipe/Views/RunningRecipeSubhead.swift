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
    
    var body: some View {
        Text("Шаг \(self.numberCurrentStep): Влейте \(self.massWatter) гр вода")
            .font(.system(size: 22))
            .fontWeight(.bold)
            .foregroundColor(Color("text-primary"))
            .tracking(0.8)
            .multilineTextAlignment(.center)
            .padding(.top, 24.0)
            .padding(.bottom, 8.0)
    }
}

struct RunningRecipeSubhead_Previews: PreviewProvider {
    static var previews: some View {
        RunningRecipeSubhead(numberCurrentStep: 2, massWatter: 50)
            .previewLayout(.sizeThatFits)
    }
}
