//
//  ModifiewView.swift
//  MagneticPoetry
//
//  Created by Noah Brauner on 11/23/20.
//

import SwiftUI

struct ModifierView: View {
    var word: String
    
    var body: some View {
        Text(word)
            .padding(.horizontal, 6)
            .frame(height: 28)
            .background(Color.white)
    }
}
