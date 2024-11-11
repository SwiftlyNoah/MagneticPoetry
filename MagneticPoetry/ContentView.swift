//
//  ContentView.swift
//  MagneticPoetry
//
//  Created by Noah Brauner on 11/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var showWordGrid = false
    @State var words = ["I", "am", "men", "we", "to", "and", "the", "to", "book", "happily", "student", "computer", "video", "grass", "school", "fun", "love", "floor", "book", "eat", "penguin", "desk", "burrito", "español", "sandwich", "eggs", "bike", "saw"]
    @State var posSelected = PartOfSpeech.noun
    @State var newWords = WordMaker.shared.getNewWords(of: .noun)
    
    @State var showWordEditor = false
    @State var wordToModify: UUID? = nil
    
    let newWordPub = NotificationCenter.default
        .publisher(for: NSNotification.Name("NewWordPressed"))
    let newPosPub = NotificationCenter.default
        .publisher(for: NSNotification.Name("NewPosPressed"))
    let wordTappedPub = NotificationCenter.default
        .publisher(for: Notification.Name("WordTapped"))
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .edgesIgnoringSafeArea(.all)
                
                ForEach(0 ..< words.count, id: \.self) {
                    let minX = -(screen.size.width/2-30)
                    let maxX = screen.size.width/2-30
                    let minY = -(screen.size.height/2-geometry.safeAreaInsets.top-30)
                    let maxY = screen.size.height/2-geometry.safeAreaInsets.bottom-100
                    let x = CGFloat.random(in: minX...maxX)
                    let y = CGFloat.random(in: minY...maxY)
                    WordView(showWordEditor: $showWordEditor,
                             word: self.words[$0],
                             rectPosition: CGPoint(x: x, y: y),
                             topSafeAreaInset: geometry.safeAreaInsets.top,
                             bottomSafeAreaInset: geometry.safeAreaInsets.bottom)
                }
                
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            .frame(width: screen.size.width-100, height: 50)
                        NewWordMenuView(showWordGrid: $showWordGrid, posSelected: $posSelected)
                        .padding(.horizontal, 10)
                    }
                    
                    QGrid(newWords, columns: 4, hSpacing: 0, content: { value in
                        NewWordView(showWordGrid: $showWordGrid, model: value)
                    })
                }
                .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                .frame(width: screen.size.width-100, height: screen.size.height/2-50)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .offset(y: showWordGrid ? 0 : 700)
                .animation(.easeInOut(duration: 0.3))
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .offset(y: showWordEditor ? screen.size.height/2-geometry.safeAreaInsets.bottom-10 : 700)
                    ModifiersView()
                        .offset(x: 30, y: showWordEditor ? screen.size.height/2-geometry.safeAreaInsets.bottom-45 : 700)
                }
                .frame(width: screen.size.width, height: 140)
                .animation(.easeInOut(duration: 0.2))
                
            }
            .onLongPressGesture {
                showWordGrid = true
            }
        }
        .onReceive(newWordPub) { output in
            self.addNewWord(output)
        }
        .onReceive(newPosPub) {_ in
            newWords = WordMaker.shared.getNewWords(of: posSelected)
        }
    }
    
    func addNewWord(_ notification: Notification) {
        let word = notification.userInfo?["word"] as! String
        words.append(word)
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone 12"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
