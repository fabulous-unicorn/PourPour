//
//  PourTextField.swift
//  PourPour
//
//  Created by Alesya on 08.11.2021.
//

import SwiftUI

struct Headline: View {
    let text: String
    
    var body: some View {
        Text(self.text)
            .font(.headline)
            .foregroundColor(Color("text-primary"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct PourSeparator: View {
    var color: Color
    
    var body: some View {
        Rectangle()
            .fill(self.color)
            .frame(maxWidth: .infinity, maxHeight: 1.0)
            .padding(.leading, 16.0)
    }
}

struct PourTextField: View {
    let labelText: String
    let placeholder: String
    @Binding var text: String
    
    @State private var isFocused: Bool = false
        
    var body: some View {
        VStack(spacing: 9.0) {
            Headline(text: labelText)
                .padding(.trailing, 16.0)

            HStack(spacing: 6.0) {

                TextField(
                    self.placeholder,
                    text: $text)
                    .foregroundColor(Color("text-basic"))
                    .disableAutocorrection(true)
                    .accentColor(Color("control-accent"))
                    //TODO: becomeFirstResponder ??
                    .onTapGesture(perform: {
                        self.isFocused = !isFocused
                    })
                    .padding(.trailing, 16.0)
                   
                if !text.isEmpty {
                    Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(Color(UIColor.opaqueSeparator))
                        }
                        .padding(.trailing, 8)
                }
            }
            
            let color = self.isFocused ? Color("control-accent") : Color(.separator)
            PourSeparator(color: color)

        }
        .padding(.leading, 16.0)
        
    }
}

#if DEBUG
struct PourTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        PourTextField(labelText: "Название рецепта",
                      placeholder: "Колумбия мытой обработки",
                      text: .constant(""))
            .previewLayout(.sizeThatFits)
        
        PourTextField(labelText: "Название рецепта",
                      placeholder: "Колумбия мытой обработки",
                      text: .constant("Колумбия мытой обработки"))
            .previewLayout(.sizeThatFits)
    }
}
#endif