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
                KeyboardCharacterKey("Q", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("W", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("E", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("R", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("T", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("Y", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("U", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("I", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("O", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("P", isCapsLocked: isCapsLocked)
            }
            HStack(spacing: 6) {
                KeyboardCharacterKey("A", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("S", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("D", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("F", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("G", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("H", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("J", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("K", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("L", isCapsLocked: isCapsLocked)
            }
            
            HStack(spacing: 6) {
                
                HStack {
                    CapsLockKey(isCapsLocked: isCapsLocked)
                    Spacer().frame(width: 6)
                }
                
                KeyboardCharacterKey("Z", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("X", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("C", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("V", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("B", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("N", isCapsLocked: isCapsLocked)
                KeyboardCharacterKey("M", isCapsLocked: isCapsLocked)
                
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
