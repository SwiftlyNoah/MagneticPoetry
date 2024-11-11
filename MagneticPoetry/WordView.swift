//
//  WordView.swift
//  MagneticPoetry
//
//  Created by Noah Brauner on 11/21/20.
//

import SwiftUI


struct WordView: View {
    //for identifying which word is highlighted
    var id: UUID = UUID()
    @Binding var showWordEditor: Bool
    
    var word: String
    
    @State var rectPosition: CGPoint
    
    var topSafeAreaInset: CGFloat
    var bottomSafeAreaInset: CGFloat

    var body: some View {
        Text(word)
            .lineLimit(0)
            .padding(.horizontal, 6)
            .frame(height: 28)
            .background(Color.white)
            .offset(x: rectPosition.x, y: rectPosition.y)
            .gesture(
                DragGesture().onChanged { value in
                    var x: CGFloat
                    var y: CGFloat
                    if value.location.x < -(screen.size.width/2-30) {
                        x = -(screen.size.width/2-30)
                    }
                    else if value.location.x > screen.size.width/2-30 {
                        x = screen.size.width/2-30
                    }
                    else {
                        x = value.location.x
                    }
                    if value.location.y < -(screen.size.height/2-topSafeAreaInset-30) {
                        y = -(screen.size.height/2-topSafeAreaInset-30)
                    }
                    else if value.location.y > screen.size.height/2-bottomSafeAreaInset-100 {
                        y = screen.size.height/2-bottomSafeAreaInset-100
                    }
                    else {
                        y = value.location.y
                    }
                    self.rectPosition = CGPoint(x: x, y: y)
                }
                .onEnded { value in
                    var x: CGFloat
                    var y: CGFloat
                    if value.location.x < -(screen.size.width/2-30) {
                        x = -(screen.size.width/2-30)
                    }
                    else if value.location.x > screen.size.width/2-30 {
                        x = screen.size.width/2-30
                    }
                    else {
                        x = value.location.x
                    }
                    if value.location.y < -(screen.size.height/2-topSafeAreaInset-30) {
                        y = -(screen.size.height/2-topSafeAreaInset-30)
                    }
                    else if value.location.y > screen.size.height/2-bottomSafeAreaInset-100 {
                        y = screen.size.height/2-bottomSafeAreaInset-100
                    }
                    else {
                        y = value.location.y
                    }
                    self.rectPosition = CGPoint(x: x, y: y)
                }
            )
            .onTapGesture {
                showWordEditor.toggle()
            }
    }
}

struct Word {
    let word: String
    let partOfSpeech: [PartOfSpeech]
}
