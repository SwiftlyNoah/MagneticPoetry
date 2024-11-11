//
//  Extensions.swift
//  MagneticPoetry
//
//  Created by Noah Brauner on 11/20/20.
//

import SwiftUI

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

extension Binding {
    func didSet(execute: @escaping (Value) ->Void) -> Binding {
        return Binding(
            get: {
                return self.wrappedValue
            },
            set: {
                let snapshot = self.wrappedValue
                self.wrappedValue = $0
                execute(snapshot)
            }
        )
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? CGFloat(0.80) : 1.0)
            .animation(configuration.isPressed ? Animation.spring(response: 0.35, dampingFraction: 0.35, blendDuration: 1) : nil)
    }
}

struct POSButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .padding(.all, 5)
            .padding(.horizontal, 10)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .scaleEffect(configuration.isPressed ? CGFloat(0.80) : 1.0)
            .animation(Animation.spring(response: 0.35, dampingFraction: 0.35, blendDuration: 1))

    }
}

extension Button {
    func myButtonStyle() -> some View {
        self.buttonStyle(MyButtonStyle())
    }
    
    func posButtonStyle(color: Color) -> some View {
        self.buttonStyle(POSButtonStyle(color: color))
    }
}

let screen = UIScreen.main.bounds
