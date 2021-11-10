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
                return .invalid(error: "??Ошибка")
            }
            return .valid
        case .water:
            guard Int(newValue) != nil else {
                return .invalid(error: "??Ошибка")
            }
            return .valid
        case .temperature:
            guard Int(newValue) != nil else {
                return .invalid(error: "??Ошибка")
            }
            return .valid
        case .duration:
            //TODO: Добавить валидацию
            return .valid
        }
    }
}

enum ValidationStatus {
    case valid
    case invalid(error: String)
}

//            let filtered = value.filter { "0123456789".contains($0) }
//            guard filtered == value else { return .invalide(error "Невалидные символы")}
