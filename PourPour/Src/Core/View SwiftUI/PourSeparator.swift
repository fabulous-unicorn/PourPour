//
//  PourSeparator.swift
//  PourPour
//
//  Created by Alesya on 09.11.2021.
//

import SwiftUI

struct PourSeparator: View {
    var color: Color
    
    var body: some View {
        Rectangle()
            .fill(self.color)
            .frame(maxWidth: .infinity, maxHeight: 1.0)
            .padding(.leading, 16.0)
    }
}

struct PourSeparator_Previews: PreviewProvider {
    static var previews: some View {
        PourSeparator(color: .red)
    }
}
