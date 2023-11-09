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
                EmptyView()
            case .extraPunctuationMarks, .number:
                NumberAndPunctuationMarkKeyboard(type: type)
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
