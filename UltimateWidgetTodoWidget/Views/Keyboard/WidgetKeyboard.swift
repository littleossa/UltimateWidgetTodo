//
//  WidgetKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct WidgetKeyboard: View {
    
    var isCapsLocked: Bool {
        KeyboardInputManager.shared.isCapsLocked
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 6) {
                ForEach(KeyboardInputManager.topRowLetters, id: \.self) {
                    KeyboardCharacterKey($0, isCapsLocked: isCapsLocked)
                }
            }
            
            HStack(spacing: 6) {
                ForEach(KeyboardInputManager.centerRowLetters, id: \.self) {
                    KeyboardCharacterKey($0, isCapsLocked: isCapsLocked)
                }
            }
            
            HStack(spacing: 6) {
                
                HStack {
                    CapsLockKey(isCapsLocked: isCapsLocked)
                    Spacer().frame(width: 6)
                }
                
                ForEach(KeyboardInputManager.bottomRowLetters, id: \.self) {
                    KeyboardCharacterKey($0, isCapsLocked: isCapsLocked)
                }
                
                HStack {
                    Spacer().frame(width: 6)
                    DeleteKey()
                }
            }
            
            HStack(spacing: 4) {
                
                NumberModeKey()
                EmojiModeKey()
                SpaceKey()
                DoneKey(inputText: "a")
            }
        }
        .background(.keyboardBackground)
        .buttonStyle(.plain)
    }
}

#Preview(as: .systemLarge) {
    AddTodoItemPreviewWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
}
