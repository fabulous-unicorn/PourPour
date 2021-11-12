//
//  RecipeSpecificationRowType.swift
//  PourPour
//
//  Created by Alesya on 09.11.2021.
//

import Foundation

enum RecipeSpecificationRowType {
    case coffee
    case water
    case temperature
    case duration
    
    var imageName: String {
        get {
            switch self {
            case .coffee:
                return "coffee"
            case .water:
                return "water"
            case .temperature:
                return "temperature"
            case .duration:
                return "timer"
            }
        }
    }
    
    var label: String {
        get{
            switch self {
            case .coffee:
                return "Кофе"
            case .water:
                return "Вода"
            case .temperature:
                return "Температура"
            case .duration:
                return "Общее время"
            }
        }
    }
    
    var postfix: String {
        get {
            switch self {
            case .coffee:
                return "гр"
            case .water:
                return "гр"
            case .temperature:
                return "°C"
            case .duration:
                return ""
            }
        }
    }
    
    func validateValue(_ newValue: String) -> ValidationStatus {
        switch self {
        case .coffee:
            guard Double(newValue) != nil else {
                return .invalid(error: "Неверное значение для массы кофе")
            }
            return .valid
        case .water:
            guard Int(newValue) != nil else {
                return .invalid(error: "Неверное значение для массы воды")
            }
            return .valid
        case .temperature:
            guard Int(newValue) != nil else {
                return .invalid(error: "Неверное значение для температуры")
            }
            return .valid
        case .duration:
            //TODO: Временное решение(т.к. timepicker отложен)

            let duration = newValue.trimmingCharacters(in: CharacterSet.whitespaces)
            let regex = "[0-9][0-9]\\:[0-5][0-9]$"
            let predicate = NSPredicate(format:"SELF MATCHES %@",regex)
            let result = predicate.evaluate(with: duration)
            
            guard result else {
                return .invalid(error: "Неверное значение для продолжительности рецепта (общее количество секунд)")
            }
            return .valid
        }
    }
}

enum ValidationStatus {
    case valid
    case invalid(error: String)
}


