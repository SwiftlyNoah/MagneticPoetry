//
//  NewWordView.swift
//  MagneticPoetry
//
//  Created by Noah Brauner on 11/21/20.
//

import SwiftUI

struct NewWordMenuView: View {
    @Binding var showWordGrid: Bool
    @Binding var posSelected: PartOfSpeech
    @State var scale: CGFloat = 1.00
    
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    PartOfSpeechView(color: Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), partOfSpeech: .noun, posSelected: $posSelected)
                    PartOfSpeechView(color: Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)), partOfSpeech: .verb, posSelected: $posSelected)
                    PartOfSpeechView(color: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), partOfSpeech: .adjective, posSelected: $posSelected)
                    PartOfSpeechView(color: Color(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)), partOfSpeech: .pronoun, posSelected: $posSelected)
                    PartOfSpeechView(color: Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)), partOfSpeech: .adverb, posSelected: $posSelected)
                    PartOfSpeechView(color: Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)), partOfSpeech: .preposistion, posSelected: $posSelected)
                    PartOfSpeechView(color: Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)), partOfSpeech: .other, posSelected: $posSelected)
                }
            }
            
            Button(action: {
                showWordGrid.toggle()
            }) {
                Image(systemName: "x.circle")
                    .font(.system(size: 25))
                    .foregroundColor(.black)
            }
            .myButtonStyle()
            
        }
    }
}
