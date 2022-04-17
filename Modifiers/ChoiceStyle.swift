//
//  ChoiceStyle.swift
//  RockBrainUp
//
//  Created by Haneen Mahdin on 16/04/22.
//

import SwiftUI

struct ChoiceStyle: ViewModifier {
    var size: CGFloat = 150
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
            .shadow(radius: 30)
            .padding(10)
    }
}

extension View {
    func choiceStyle(size: CGFloat = 150) -> some View {
        modifier(ChoiceStyle(size: size))
    }
}

struct ChoiceStyle_Previews: PreviewProvider {
    static var previews: some View {
        Text(GameChoice.pickRandom().toString())
    }
}
