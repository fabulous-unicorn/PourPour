//
//  RunningRecipeScene.swift
//  PourPour
//
//  Created by Alesya on 19.10.2021.
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
    let percents: Double
    var body: some View {
        ZStack {
            ProgressTimerShape(percents: percents)
                .fill(Color("timer-progress"))
                .padding(.all, 30.0)
            Image("big-timer")
                .renderingMode(.template)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color("control-icon-bg"))
                .padding(.all, 0.0)
        }
        .frame(width: 200.0, height: 200.0)
    }
}

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
                Text(TimeFormaterr.formMinutesTimerString(from: currentTime))
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



struct StepList: View {
    var activeStep: Int
    
    var body: some View {
        List {
            StepRow(time: 0, massWatter: 50)
            StepRow(time: 30, massWatter: 50)
            StepRow(time: 60, massWatter: 50)
        }
        
        .colorMultiply(Color("surface-secondary-bg"))
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        .onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}



struct RunningRecipeScene: View {
    @State private var percents: Double = 20
    
    var body: some View {
        VStack(spacing: 8.0) {
            
            Text("Шаг []: Влейте [] гр вода")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(Color("text-primary"))
                .tracking(0.8)
                .multilineTextAlignment(.center)
                .padding(.top, 24.0)
                .padding(.bottom, 8.0)
        
            ProgressTimerView(percents: self.percents)
            
//            HStack(spacing: 8.0) {
//                Button(action: {
//                    print("onTouchedButtonReset")
//                    withAnimation(.linear(duration: 1)) {
//                        self.percents = 0
//                    }
//                }, label: {
//                    Text("Reset")
//                        .frame(maxWidth: .infinity)
//                })
//                .buttonStyle(SecondaryButtonStyle())
//
//                Button(action: {
//                    print("onTouchedButtonStart")
//                    withAnimation(.linear(duration: 1)) {
//                        self.percents += 20
//                    }
//                }, label: {
//                    Text("Start")
//                        .frame(maxWidth: .infinity)
//                })
//                .buttonStyle(PrimaryButtonStyle())
//            }
            
            
            CommonTime(currentTime: 32)
                .padding(.bottom, 8)
            
            StepList(activeStep: 2)
        }
    }
}

struct RunningRecipeScene_Previews: PreviewProvider {
    static var previews: some View {
        RunningRecipeScene()
    }
}
