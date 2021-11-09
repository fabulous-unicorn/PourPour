//
//  Headline.swift
//  PourPour
//
//  Created by Alesya on 09.11.2021.
//

import SwiftUI

struct Headline: View {
    let text: String
    
    var body: some View {
        Text(self.text)
            .font(.headline)
            .foregroundColor(Color("text-primary"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Headline_Previews: PreviewProvider {
    static var previews: some View {
        Headline(text: "Заголовок")
    }
}
