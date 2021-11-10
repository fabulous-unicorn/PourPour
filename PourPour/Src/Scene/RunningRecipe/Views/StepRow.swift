//
//  StepRow.swift
//  PourPour
//
//  Created by Alesya on 20.10.2021.
//

import SwiftUI


struct StepRow: View {
    let startTime: Int
    let massWater: Int
    
    var body: some View {
        HStack(alignment: .center) {
            Text(TimeFormater.formMinutesTimerString(from: self.startTime))
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
                .padding(.leading, 16.0)
                .padding(.vertical, 8.0)

            HStack(alignment: .bottom, spacing: 2.0) {
                Text("влить")
                    .font(.body)
                    .foregroundColor(Color("text-basic"))

                Image("water")
                    .foregroundColor(Color("control-icon-bg"))
                    .frame(width: 24.0, height: 24.0)

                Text("\(self.massWater)")
                    .font(.system(size: 20,
                                  weight: .bold)
                            .monospacedDigit())
                    .foregroundColor(Color("text-primary"))
                    .tracking(0.38)

                Text("гр")
                    .font(.body)
                    .foregroundColor(Color("text-secondary"))
            }

            Spacer()
        }
        .background(Color(.clear))
    }
}

struct StepRow_Previews: PreviewProvider {
    static var previews: some View {
        StepRow(startTime: 0, massWater: 50)
            .previewLayout(.sizeThatFits)
    }
}

