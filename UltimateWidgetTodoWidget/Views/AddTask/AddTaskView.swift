//
//  AddTaskView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct AddTaskView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: WidgetConfig.colorHeaderHeight - 16)
            
            HStack {
                CloseButton()
                .offset(x: -8)
                
                Spacer()
            }
            .frame(height: WidgetConfig.topBarHeight)
            
            Line()
                .stroke(style: .init(lineWidth: 2))
                .foregroundStyle(.gray)
                .frame(height: 2)
                .padding(.bottom, 4)
            
            Spacer()
            
            InputForm(text: KeyboardInputManager.shared.inputText)
                        
            Spacer().frame(height: 26)
                        
            WidgetKeyboard()
        }
        .containerBackground(for: .widget) {
            KeyboardOverlayBackgroundView()
        }
    }
}

// MARK: - Preview
#if DEBUG
struct AddTaskPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            AddTaskView()
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    AddTaskPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
#endif

