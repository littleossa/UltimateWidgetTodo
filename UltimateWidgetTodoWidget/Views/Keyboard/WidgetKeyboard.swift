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
            
            AlphabetKeyboard()
            
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
    AddTaskPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
