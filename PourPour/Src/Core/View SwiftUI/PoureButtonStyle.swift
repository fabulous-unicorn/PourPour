//
//  PoureButtonStyle.swift
//  TimerAnimateSwiftUI
//
//  Created by Alesya on 15.10.2021.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(
                    .system(size: 17, weight: .bold))
                .padding(.vertical, 12.0)
                .padding(.horizontal, 16.0)
                .background(Color("control-accent"))
                .foregroundColor(Color("control-tint-primary"))
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 0.9: 1)
                .animation(.spring())
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(
                    .system(size: 17, weight: .bold))
                .padding(.vertical, 12.0)
                .padding(.horizontal, 16.0)
                .foregroundColor(Color("control-tint-primary"))
                .overlay(Capsule()
                            .stroke(Color("control-accent"), lineWidth: 2)
                )
                .scaleEffect(configuration.isPressed ? 0.9: 1)
                .animation(.spring())
    }
}


struct PoureButton: View {
    var body: some View {
        Button(action: {
            print("onTouchedButtonStart")
        }, label: {
            Text("Start")
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(PrimaryButtonStyle())
        
        Button(action: {
            print("onTouchedButtonStart")
        }, label: {
            Text("Start")
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(SecondaryButtonStyle())
    }
}

struct PoureButton_Previews: PreviewProvider {
    static var previews: some View {
        PoureButton()
            .previewLayout(.sizeThatFits)
    }
}
