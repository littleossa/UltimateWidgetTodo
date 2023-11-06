//
//  WidgetKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct WidgetKeyboard: View {
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            switch KeyboardInputManager.shared.inputMode {
            case .alphabet:
                AlphabetKeyboard()
            case .emoji:
                EmptyView()
            case .number:
                NumberAndPunctuationMarkKeyboard()
            }
            
            HStack(spacing: 4) {
                
                NumberModeKey()
                    .frame(width: 36, height: 34)
                EmojiModeKey()
                    .frame(width: 36, height: 34)
                SpaceKey()
                    .frame(width: 154, height: 34)
                DoneKey()
                    .frame(width: 74, height: 34)
            }
        }
        .background(.keyboardBackground)
        .buttonStyle(.plain)
    }
}

#Preview(as: .systemLarge) {
    AddTaskPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
