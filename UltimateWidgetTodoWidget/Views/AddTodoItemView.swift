//
//  AddTodoItemView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct AddTodoItemView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
                .containerBackground(for: .widget) {
                    WidgetBackgroundView()
                }
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
