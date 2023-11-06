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
