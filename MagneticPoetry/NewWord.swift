//
//  NewWord.swift
//  MagneticPoetry
//
//  Created by Noah Brauner on 11/21/20.
//

import SwiftUI

struct NewWordView: View, Identifiable {
    var id: UUID = UUID()
    
    @Binding var showWordGrid: Bool
    
    var model: NewWordModel
    
    var body: some View {
        Text(model.word)
            .lineLimit(0)
            .font(.system(size: model.word.count > 5 ? CGFloat(19-model.word.count) : 16))
            .frame(height: 28)
            .padding(.horizontal, 5)
            .background(Color.white)
            .onTapGesture {
                self.showWordGrid.toggle()
                NotificationCenter.default.post(name: NSNotification.Name("NewWordPressed"),
                                                object: nil, userInfo: ["word": model.word])
            }
    }
}


class NewWordModel: Identifiable {
    var id: UUID = UUID()

    typealias ID = UUID
    let word: String

    init(word: String) {
        self.word = word
    }
}
