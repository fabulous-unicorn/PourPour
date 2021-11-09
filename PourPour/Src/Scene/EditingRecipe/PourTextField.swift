//
//  PourTextField.swift
//  PourPour
//
//  Created by Alesya on 08.11.2021.
//

import SwiftUI

struct PourTextField: View {
    let labelText: String
    let placeholder: String
    @Binding var text: String
    
    @State private var isFocused: Bool = false
        
    var body: some View {
        VStack(spacing: 8.0) {
            if labelText != "" {
                Headline(text: labelText)
                    .padding(.horizontal, 16.0)
            }
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
                    .padding(.horizontal, 16.0)
                   
                if !text.isEmpty {
                    Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(Color(UIColor.opaqueSeparator))
                        }
                    .padding(.trailing, 16.0)
                }
            }
            
            let color = self.isFocused ? Color("control-accent") : Color(.separator)
            PourSeparator(color: color)
        }
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
