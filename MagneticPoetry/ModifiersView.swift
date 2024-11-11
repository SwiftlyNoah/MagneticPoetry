//
//  Modifiers.swift
//  MagneticPoetry
//
//  Created by Noah Brauner on 11/23/20.
//

import SwiftUI

struct ModifiersView: View {
    var body: some View {
        HStack {
            Button(action: {
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .font(.system(size: 25))
                    .foregroundColor(.black)
            }
            ScrollView(.horizontal) {
                HStack {
                    ModifierView(word: "s")
                    ModifierView(word: "ed")
                    ModifierView(word: "ing")
                    ModifierView(word: "er")
                    ModifierView(word: "ful")
                    ModifierView(word: "ly")
                    ModifierView(word: "en")
                    ModifierView(word: "est")
                    ModifierView(word: "r")
                    ModifierView(word: "r")
                }
            }
        }
    }
}
