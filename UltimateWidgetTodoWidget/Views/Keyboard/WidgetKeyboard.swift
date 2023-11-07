//
//  WidgetKeyboard.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct WidgetKeyboard: View {
    
    let taskType: EditTaskType
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            switch KeyboardInputManager.shared.inputMode {
            case .alphabet:
                AlphabetKeyboard(taskType: taskType)
            case .emoji:
                EmptyView()
            case .extraPunctuationMarks, .number:
                NumberAndPunctuationMarkKeyboard(taskType: taskType)
            }
        }
        .background(.keyboardBackground)
        .buttonStyle(.plain)
    }
}

#Preview(as: .systemLarge) {
    EditTaskPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
