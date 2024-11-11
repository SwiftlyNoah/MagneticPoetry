//
//  PartOfSpeechView.swift
//  MagneticPoetry
//
//  Created by Noah Brauner on 11/21/20.
//

import SwiftUI

struct PartOfSpeechView: View {
    var color: Color
    var partOfSpeech: PartOfSpeech
    @Binding var posSelected: PartOfSpeech
    
    var body: some View {
        Button("\(partOfSpeech.rawValue)") {
            posSelected = partOfSpeech
            NotificationCenter.default.post(name: NSNotification.Name("NewPosPressed"), object: nil)
        }
        .posButtonStyle(color: posSelected == partOfSpeech ? color : Color.gray)
        
    }
    
}

enum PartOfSpeech {
    case noun, verb, adjective, pronoun, preposistion, adverb, other
    
    var rawValue: String {
        switch self {
        case .noun: return "noun"
        case .verb: return "verb"
        case .adjective: return "adjective"
        case .pronoun: return "pronoun"
        case .preposistion: return "preposistion"
        case .adverb: return "adverb"
        case .other: return "other"
        }
    }
}
