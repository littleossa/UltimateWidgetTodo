//
//  WidgetKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct WidgetKeyboard: View {
    
    @Environment(\.widgetTodoCore) var core
    let type: EditTaskType
    
    var body: some View {
        
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
        .contentTransition(.identity)
        .buttonStyle(.plain)
    }
}

#Preview(as: .systemLarge) {
    EditTaskPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
