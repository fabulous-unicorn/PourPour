//
//  RecipeSpecificationRow.swift
//  PourPour
//
//  Created by Alesya on 09.11.2021.
//

import SwiftUI

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
            Text(self.entity.postfix)
                .foregroundColor(Color(.tertiaryLabel))

            Spacer()
                .frame(minWidth: 46.0)

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
struct RecipeSpecificationRow_Previews: PreviewProvider {
    
    static var test:String = "31"//some very very very long description string to be initially wider than screen"
    static var testBinding = Binding<String>(get: { test }, set: {
//        print("New value: \($0)")
        test = $0 } )

    
    static var previews: some View {
        VStack(alignment: .leading) {
            RecipeSpecificationRow(entity: .coffee, value: testBinding)
            RecipeSpecificationRow(entity: .watter, value: testBinding)
            RecipeSpecificationRow(entity: .temperature, value: testBinding)
            RecipeSpecificationRow(entity: .duration, value: testBinding)
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif
