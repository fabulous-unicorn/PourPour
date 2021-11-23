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
    @State private var hasError: Bool = false
    
    var body: some View {
        HStack {
            VStack(spacing: -1.0) {
                let placeholder = entity == .duration ? "00:00" : "0"
//                switch self.entity {
//                case .coffee, .water, .temperature:
                    TextField(
                        placeholder,
                        text: self.$value)
                        .keyboardType(.numberPad)
                        .foregroundColor(Color("text-basic"))
                        .disableAutocorrection(true)
                        .accentColor(Color("control-accent"))
                        .onReceive(Just(value)) { newValue in
                            switch self.entity {
                                case .coffee, .water, .temperature:
                                    self.validateAndChangeStateIfNeeded(newValue: newValue)
                                case .duration:
                                    let formattedValue = self.formattedTimeValue(value: newValue)
                                    if self.value != formattedValue {
                                        self.value = formattedValue
                                    }
                                    self.validateAndChangeStateIfNeeded(newValue: formattedValue)
                            }
                        }
                        .padding(.leading, 16.0)
                        if self.hasError {
                            Rectangle()
                                .fill(Color.red)
                                .padding(.leading, 16.0)
                                .frame(maxWidth: .infinity, maxHeight: 1.0)
                        }
//                case .duration :
//TODO: Добавить отдальный инпут для общего времени - datepicker отложен
//                    Text("Timer")
//                }
            }
            
            Text(self.entity.postfix)
                .foregroundColor(Color(.tertiaryLabel))

            if !value.isEmpty {
                Button(action: {
                        self.value = ""
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                            .frame(width: 24.0, height: 24.0)
                    }
                .padding(.trailing, 16.0)
            } else {
                Spacer()
                    .frame(width: 48.0)
            }
        }
        
    }
    
    func formattedTimeValue(value: String) -> String {
        //Проверка на что что десяки секунд меньше 6, только в итоговой валидации
        let mask = "##:##"
        var result = ""
        var index = value.startIndex
        for ch in mask where index < value.endIndex {
            if ch == "#" {
                result.append(value[index])
                index = value.index(after: index)
            } else {
                result.append(ch)
                if value[index] == ":" {
                    index = value.index(after: index)
                }
            }
        }
        return result
    }
    
    func validateAndChangeStateIfNeeded(newValue: String) {
        var hasError = false
        //FIXME: убрать сравнения при присваивании
        if newValue == "" {
            hasError = false
        } else {
            let status = self.entity.validateValue(newValue)
            switch status {
            case .valid:
                hasError = false
            case .invalid:
                hasError = true
            }
        }
        
        if self.hasError != hasError {
            self.hasError = hasError
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
//                .frame(width: .infinity)
            InputRow(entity: self.entity, value: self.$value)
//                .frame(width: .infinity)
        }
        .padding(.vertical, 8.0)
        .background(PourSeparator(color: Color(.separator)), alignment: .bottomTrailing)
    }
}

#if DEBUG
struct RecipeSpecificationRow_Preview_Container: View {
    @State private var coffee :String = "16"
    @State private var water :String = "320"
    @State private var temperature :String = "74"
    @State private var duration :String = "03:01"
    
    var body: some View {
        VStack(alignment: .leading) {
            RecipeSpecificationRow(entity: .coffee,
                                   value: self.$coffee)
            RecipeSpecificationRow(entity: .water,
                                   value: self.$water)
            RecipeSpecificationRow(entity: .temperature,
                                   value: self.$temperature)
            RecipeSpecificationRow(entity: .duration,
                                   value: self.$duration)
            
            Text("""
                Значения:
                    Кофе: \(coffee)
                    Вода: \(water)
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
