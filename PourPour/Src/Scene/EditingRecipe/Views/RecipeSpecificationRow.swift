//
//  RecipeSpecificationRow.swift
//  PourPour
//
//  Created by Alesya on 09.11.2021.
//

import SwiftUI
import Combine

fileprivate struct LabelRow: View {
    let imageName: String
    let label: String
    var body: some View {
            HStack(spacing: 6.0) {
                Image(self.imageName)
                    .foregroundColor(Color("control-icon-bg"))
                    .frame(width: 24.0, height: 24.0)
                    .padding(.leading, 16.0)
                Text(self.label)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
    }
}

fileprivate struct InputRow: View {
    let entity: RecipeSpecificationRowType
    @Binding var value: String
    
    var body: some View {
        HStack {
            TextField(
                "0",
                text: self.$value)
                .keyboardType(.numberPad)
                .foregroundColor(Color("text-basic"))
                .disableAutocorrection(true)
                .accentColor(Color("control-accent"))
//                .onReceive(Just(value)) { newValue in
//                    let filtered = newValue.filter { "0123456789".contains($0) }
//                    if filtered != newValue {
//                        self.value = filtered
//                    }
//                }
                    
            Text(self.entity.postfix)
                .foregroundColor(Color(.tertiaryLabel))

            if !value.isEmpty {
                Button(action: {
                        self.value = ""
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                .padding(.trailing, 16.0)
            }
        }
    }
}

struct RecipeSpecificationRow: View {
    
    let entity: RecipeSpecificationRowType
    @Binding var value: String
        
    var body: some View {
        HStack(spacing: 0.0) {
            LabelRow(imageName: self.entity.imageName,
                 label: self.entity.label)
                .frame(width: .infinity)
            InputRow(entity: self.entity, value: self.$value)
            .frame(width: .infinity)
        }
        .padding(.vertical, 8.0)
        .background(PourSeparator(color: Color(.separator)), alignment: .bottomTrailing)
    }
}

#if DEBUG
struct RecipeSpecificationRow_Preview_Container: View {
    @State private var coffee :String = "16"
    @State private var watter :String = "320"
    @State private var temperature :String = "74"
    @State private var duration :String = "03:01"
    
    var body: some View {
        VStack(alignment: .leading) {
            RecipeSpecificationRow(entity: .coffee,
                                   value: self.$coffee)
            RecipeSpecificationRow(entity: .watter,
                                   value: self.$watter)
            RecipeSpecificationRow(entity: .temperature,
                                   value: self.$temperature)
            RecipeSpecificationRow(entity: .duration,
                                   value: self.$duration)
            
            Text("""
                Значения:
                    Кофе: \(coffee)
                    Вода: \(watter)
                    Температура: \(temperature)
                    Общее время: \(duration)
                """)
                .padding()
        }
    }
}


struct RecipeSpecificationRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSpecificationRow_Preview_Container()
            .previewLayout(.sizeThatFits)
    }
}
#endif
