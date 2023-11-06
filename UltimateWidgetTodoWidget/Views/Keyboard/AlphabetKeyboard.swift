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
                        .frame(width: 26, height: 34)
                }
            }
            
            HStack(spacing: 6) {
                ForEach(KeyboardInputManager.centerRowAlphabets, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: isCapsLocked)
                        .frame(width: 26, height: 34)
                }
            }
            
            HStack(spacing: 6) {
                
                HStack {
                    CapsLockKey(isCapsLocked: isCapsLocked)
                        .frame(width: 36, height: 34)
                    Spacer().frame(width: 6)
                }
                
                ForEach(KeyboardInputManager.bottomRowAlphabets, id: \.self) {
                    KeyboardLetterKey($0, isCapsLocked: isCapsLocked)
                        .frame(width: 26, height: 34)
                }
                
                HStack {
                    Spacer().frame(width: 6)
                    BackspaceKey()
                        .frame(width: 36, height: 34)
                }
            }
        }
    }
}
