//
//  WidgetKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct WidgetKeyboard: View {
    
    @Environment(\.widgetTodoCore) var core
    let type: EditTodoItemType
    
    private var backgroundColor: Color {
        return core.keyboardInputMode == .emoji ? .emojiKeyboardBackground : .keyboardBackground
    }
    
    var body: some View {
        
        backgroundColor
            .overlay {
                VStack(spacing: 10) {
                    
                    switch core.keyboardInputMode {
                    case .alphabet:
                        AlphabetKeyboard(type: type)
                    case .emoji:
                        EmojiKeyboard()
                    case .extraPunctuationMarks, .number:
                        NumberAndPunctuationMarkKeyboard(type: type)
                    }
                }
            }
            .frame(height: WidgetConfig.keyboardHeight)
            .contentTransition(.identity)
            .buttonStyle(.plain)
    }
}

#if DEBUG
#Preview(as: .systemLarge) {
    EditItemPreviewWidget()
} timeline: {
    WidgetTodoEntry(date: .now)
}
#endif
