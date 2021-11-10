//
//  RecipeSpecificationRowType.swift
//  PourPour
//
//  Created by Alesya on 09.11.2021.
//

import Foundation

enum RecipeSpecificationRowType {
    case coffee
    case watter
    case temperature
    case duration
    
    var imageName: String {
        get {
            switch self {
            case .coffee:
                return "coffee"
            case .watter:
                return "watter"
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
            case .watter:
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
            case .watter:
                return "гр"
            case .temperature:
                return "°C"
            case .duration:
                return ""
            }
        }
    }
    
//    func validateValue(_ value: String) -> ValidationStatus {
//        switch self {
//        case .coffee:
//            <#code#>
//        case .watter:
//            
//        case .temperature:
//            
//        case .duration:
//            
//        }
//    }
}

enum ValidationStatus {
    case valid
    case invalid(error: String)
}
