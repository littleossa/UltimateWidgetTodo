//
//  NumberAndPunctuationMarkKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct NumberAndPunctuationMarkKeyboard: View {
    var body: some View {
        
        VStack(spacing: 10) {
            HStack(spacing: 6) {
                ForEach(KeyboardInputManager.topRowNumbers, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: false)
                        .frame(width: 26, height: 34)
                }
            }
            
            HStack(spacing: 6) {
                ForEach(KeyboardInputManager.centerRowPunctuationMarks, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: false)
                        .frame(width: 26, height: 34)
                }
            }
            
            HStack(spacing: 6) {
                
                HStack {
                    MorePunctuationMarksKey()
                        .frame(width: 36, height: 34)
                    Spacer().frame(width: 12)
                }
                
                ForEach(KeyboardInputManager.bottomRowPunctuationMarks, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: false)
                        .frame(width: 36, height: 34)
                }
                
                HStack {
                    Spacer().frame(width: 12)
                    DeleteKey()
                        .frame(width: 36, height: 34)
                }
            }
        }
    }
}

#Preview {
    NumberAndPunctuationMarkKeyboard()
}
