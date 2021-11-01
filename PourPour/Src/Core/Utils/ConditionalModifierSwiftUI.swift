//
//  ConditionalModifierSwiftUI.swift
//  PourPour
//
//  Created by Alesya on 01.11.2021.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
