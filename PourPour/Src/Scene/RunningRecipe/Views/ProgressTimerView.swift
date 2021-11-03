//
//  TimerView.swift
//  PourPour
//
//  Created by Alesya on 20.10.2021.
//

import SwiftUI

struct ProgressTimerShape: Shape {
    var percents: Double
    
    public var animatableData: Double {
        get { percents }
        set {
            self.percents = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        let localPercents: Double = 100 - percents
        let width = rect.size.width
        let height = rect.size.height
        let centerView = CGPoint(x: width / 2,
                                 y: height / 2)
        
        let radius = min(width, height) / 2
        let startAngle: Double = -90
        let endAngle: Double = -90 + ( localPercents / 100) * 360
        
        path.move(to: centerView)
        path.addLine(to: CGPoint(x: centerView.x,
                                 y: centerView.y - radius)
        )
        path.addArc(center: centerView,
                    radius: radius,
                    startAngle: Angle(degrees: startAngle),
                    endAngle: Angle(degrees: endAngle),
                    clockwise: false)
        path.addLine(to: centerView)
        return path
    }
}

struct ProgressTimerView: View {
    let currentSecond: Double // = 2
    let duration: Int // = 10

    var body: some View {
        ZStack {
            ProgressTimerShape(percents: currentSecond * 100 / Double(duration))
                .fill(Color("timer-progress"))
                .padding(.all, 30.0)

            Image("big-timer")
                .renderingMode(.template)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color("control-icon-bg"))
                .padding(.all, 0.0)

            if Int(self.currentSecond) == self.duration {
                Image("smile")
                    .renderingMode(.template)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color("control-icon-bg"))
                    .padding(.all, 60)
            } else {
                Text(TimeFormater.formMinutesTimerString(from: duration - Int(currentSecond)))
                    .font(.system(size: 36,
                                  weight: .bold)
                            .monospacedDigit())
                    .foregroundColor(Color("text-primary"))
            }
        }
        .frame(width: 200.0, height: 200.0)
    }
    
}

struct ProgressTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTimerView(currentSecond: 2, duration: 10)
            .previewLayout(.sizeThatFits)
        ProgressTimerView(currentSecond: 10, duration: 10)
            .previewLayout(.sizeThatFits)
    }
}
