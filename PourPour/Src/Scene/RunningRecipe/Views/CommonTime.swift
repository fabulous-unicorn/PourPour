//
//  CommonTime.swift
//  PourPour
//
//  Created by Alesya on 01.11.2021.
//

import SwiftUI

struct CommonTime: View {
    var currentTime: Int
    
    var body: some View {
        Group {
            HStack {
                Text("Общее время")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(Color("text-secondary"))
                    .frame(height:24)
                Spacer()
                Text(TimeFormater.formMinutesTimerString(from: currentTime))
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color("text-primary"))
                    .frame(height: 28.0)
                    .padding(/*@START_MENU_TOKEN@*/.vertical, 12.0/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal, 16.0)
            .background(Color("surface-secondary-bg"))
        }
    }
}

struct CommonTime_Previews: PreviewProvider {
    static var previews: some View {
        CommonTime(currentTime: 13)
            .previewLayout(.sizeThatFits)
    }
}
