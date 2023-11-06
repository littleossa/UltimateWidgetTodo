//
//  AlphabetKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct AlphabetKeyboard: View {
    
    var isCapsLocked: Bool {
        KeyboardInputManager.shared.isCapsLocked
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack(spacing: 6) {
                ForEach(KeyboardInputManager.topRowAlphabets, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: isCapsLocked)
                }
            }
            
            HStack(spacing: 6) {
                ForEach(KeyboardInputManager.centerRowAlphabets, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: isCapsLocked)
                }
            }
            
            HStack(spacing: 6) {
                
                HStack {
                    CapsLockKey(isCapsLocked: isCapsLocked)
                    Spacer().frame(width: 6)
                }
                
                ForEach(KeyboardInputManager.bottomRowAlphabets, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: isCapsLocked)
                }
                
                HStack {
                    Spacer().frame(width: 6)
                    DeleteKey()
                }
            }
        }
    }
}
