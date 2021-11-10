//
//  PourEditingText.swift
//  PourPour
//
//  Created by Alesya on 08.11.2021.
//

import SwiftUI

struct PourEditorText: View {
    let labelText: String
    @Binding private var text: String
    
    private var placeholder: String
    private var onCommit: (() -> Void)?
    private var internalText: Binding<String> {
        Binding<String>(get: { self.text } ) {
            self.text = $0
            self.showingPlaceholder = $0.isEmpty
        }
    }
    
    @State private var dynamicHeight: CGFloat = UIFont.systemFontSize
    @State private var showingPlaceholder = false
    
    init (labelText: String = "", placeholder: String = "", text: Binding<String>, onCommit: (() -> Void)? = nil) {
        self.labelText = labelText
        self.placeholder = placeholder
        
        self.onCommit = onCommit
        
        self._text = text
        self._showingPlaceholder = State<Bool>(initialValue: self.text.isEmpty)
    }
    
    var body: some View {
        
        VStack(spacing: 8.0) {
            if self.labelText != "" {
                Headline(text: self.labelText)
                    .padding(.horizontal, 16.0)
            }

            HStack(spacing: 6.0) {
                
                UITextViewWrapper(text: self.internalText, calculatedHeight: $dynamicHeight, onDone: onCommit)
                    .accentColor(Color("control-accent"))
                    .frame(minHeight: dynamicHeight, maxHeight: dynamicHeight)
                    .background(placeholderView, alignment: .topLeading)
                    
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
    
    var placeholderView: some View {
        Group {
            if showingPlaceholder {
                Text(placeholder).foregroundColor(Color(UIColor.tertiaryLabel))
            }
        }
    }
}

#if DEBUG
struct PourEditorText_Preview_Container : View {
     @State private var value = ""
    //Описание простого рецепта. Возможная дополнительная информация

     var body: some View {
        VStack(alignment: .leading) {
            PourEditorText(labelText: "Дополнительная информация",placeholder: "...", text: $value, onCommit: {
                print("Final text: \(value)")
            })
            Text("Описание: \(self.value)")
                .padding()
            Spacer()
        }
     }
}

struct PourEditorText_Previews: PreviewProvider {
    static var previews: some View {
        PourEditorText_Preview_Container()
    }
}
#endif
