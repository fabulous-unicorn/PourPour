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
            .padding(.bottom, 8.0)
            .background(PourSeparator(color: Color(.separator)), alignment: .bottomTrailing)
        }
    }
}

#if DEBUG
struct PourTextField_Preview_Container: View {
    @State private var value = ""
    
    var body: some View {
        VStack {
            PourTextField(labelText: "Название рецепта",
                          placeholder: "Колумбия мытой обработки",
                          text: self.$value)
            Text("Название: \(self.value)")
                .padding()
            Spacer()
        }
    }
}

struct PourTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        PourTextField_Preview_Container()
    }
}
#endif
