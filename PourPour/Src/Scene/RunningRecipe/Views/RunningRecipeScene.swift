//
//  RunningRecipeScene.swift
//  PourPour
//
//  Created by Alesya on 19.10.2021.
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
    @State private var currentSecond: Int = 2
    @State private var lastSecond: Int = 10
    
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
        
            ProgressTimerView(
                currentSecond: self.currentSecond,
                lastSecond: self.lastSecond)

            CommonTime(currentTime: 32)
                .padding(.bottom, 8)

            StepList()
            
            //Для отладки анимации
            HStack(spacing: 8.0) {
                Button(action: {
                    print("onTouchedButtonReset")
                    withAnimation(.linear(duration: 1)) {
                        self.currentSecond = 0
                    }
                }, label: {
                    Text("Reset")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(SecondaryButtonStyle())

                Button(action: {
                    print("onTouchedButtonStart")
                    withAnimation(.linear(duration: 1)) {
                        self.currentSecond += 1
                    }
                }, label: {
                    Text("Start")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(PrimaryButtonStyle())
            }
        }
    }
}

struct RunningRecipeScene_Previews: PreviewProvider {
    static var previews: some View {
        RunningRecipeScene()
    }
}
