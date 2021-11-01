//
//  ComplitedStepRow.swift
//  PourPour
//
//  Created by Alesya on 01.11.2021.
//

import SwiftUI

struct ComplitedStepRow: View {
    let startTime: Int
    
    var body: some View {
        HStack(alignment: .center) {
            Text(TimeFormaterr.formMinutesTimerString(from: self.startTime))
                .font(.system(size: 17,
                              weight: .semibold)
                        .monospacedDigit())
                .foregroundColor(Color("text-primary"))
                .tracking(-0.41)
                .padding(.vertical, 6.0)
                .padding(.horizontal, 12.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 6.0)
                        .stroke(Color("control-accent"), lineWidth: 1.5))
                .padding(.leading, 12.0)
                .padding(.vertical, 8.0)

            HStack(alignment: .bottom, spacing: 2.0) {

                Image("watter")
                    .foregroundColor(Color("control-icon-bg"))
                    .frame(width: 24.0, height: 24.0)

                Text("Завершение")
                    .font(.system(size: 20,
                                  weight: .bold)
                            .monospacedDigit())
                    .foregroundColor(Color("text-primary"))
                    .tracking(0.38)

            }

            Spacer()
        }
    }
}

struct ComplitedStepRow_Previews: PreviewProvider {
    static var previews: some View {
        ComplitedStepRow(startTime: 20)
    }
}
