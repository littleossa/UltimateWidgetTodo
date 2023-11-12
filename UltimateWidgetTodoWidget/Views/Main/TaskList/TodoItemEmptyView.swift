//
//  TodoItemEmptyView.swift
//  UltimateWidgetTodoWidgetExtension
//
//


import SwiftUI

struct TodoItemEmptyView: View {
        
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text("What's your task?")
                        .font(.system(size: 32))
                        .bold()
                        .foregroundStyle(Color.black)
                    
                    Text("Start by adding a new one.")
                        .font(.system(size: 20))
                        .fontWeight(.light)
                }
                
                PlusButtonImage()
                    .frame(width: 80, height: 80)
                
                Spacer()
            }
            PresentAddItemViewButton(type: .fullScreen)
        }
    }
}

// MARK: - Preview
#if DEBUG
import WidgetKit

struct TodoItemEmptyPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            TodoItemEmptyView()
                .containerBackground(for: .widget) {
                    WidgetBackgroundView()
                }
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    TodoItemEmptyPreviewWidget()
} timeline: {
    WidgetTodoEntry(date: .now)
}
#endif
