//
//  SpecificationsList.swift
//  PourPour
//
//  Created by Alesya on 09.11.2021.
//

import SwiftUI

struct RecipeSpecificationsList: View {
    @Binding var massCoffee: String
    @Binding var massWatter: String
    @Binding var temperature: String
    @Binding var duration: String
    
    var body: some View {
        VStack {
            Headline(text: "Характеристики")
                .padding(.horizontal, 16.0)
            VStack(alignment: .leading) {
                RecipeSpecificationRow(entity: .coffee,
                                       value: self.$massCoffee)
                RecipeSpecificationRow(entity: .watter,
                                       value: self.$massWatter)
                RecipeSpecificationRow(entity: .temperature,
                                       value: self.$temperature)
                RecipeSpecificationRow(entity: .duration,
                                       value: self.$duration)
            }
        }
    }
}

#if DEBUG
struct RecipeSpecificationsList_Previews: PreviewProvider {
    static var massCoffee: String = "17,5"
    static var massWatter: String = "250"
    static var temperature: String = "64"
    static var duration: String = "03:01"
    
    static var previews: some View {
        RecipeSpecificationsList(massCoffee: .constant(self.massCoffee),
                                 massWatter: .constant(self.massWatter),
                                 temperature: .constant(self.temperature),
                                 duration: .constant(self.duration))
    }
}
#endif
