//
//  AddTodoItemView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct AddTodoItemView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: WidgetConfig.colorHeaderHeight - 16)
            
            HStack {
                CloseButton()
                .offset(x: -8)
                
                Spacer()
            }
            
            Spacer()
            
            InputForm(text: KeyboardInputManager.shared.inputText)
                        
            Spacer().frame(height: 28)
                        
            WidgetKeyboard()
        }
        .containerBackground(for: .widget) {
            KeyboardOverlayBackgroundView()
        }
    }
}

// MARK: - Preview
#if DEBUG
struct AddTodoItemPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            AddTodoItemView()
                .modelContainer(AppModelContainer.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    AddTodoItemPreviewWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
}
#endif

