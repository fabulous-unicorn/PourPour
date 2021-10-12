//
//  FormMinutesTimerString.swift
//  PourPour
//
//  Created by Alesya on 07.10.2021.
//

import Foundation

class TimeFormaterr {
    
    static func formMinutesTimerString(from seconds: Int) -> String {
        
        var result = ""
        
        let minutesTimer = seconds / 60
        let secondsTimer = seconds - minutesTimer * 60
        
        if minutesTimer < 10 {
            result += "0\(minutesTimer):"
        } else {
            result += "\(minutesTimer):"
        }
        
        if secondsTimer < 10 {
            result += "0\(secondsTimer)"
        } else {
            result += "\(secondsTimer)"
        }
        
        return result
    }
}
