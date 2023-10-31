//
//  UltimateWidgetTodoWidget.swift
//  UltimateWidgetTodoWidget
//
//

import WidgetKit
import SwiftUI

struct UltimateWidgetTodoWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetTodoProvider()) { entry in
            TodoListView()
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Ultimate Widget Todo")
        .description("This is an Ultimate Todo List App with a Widget.")
    }
}

#Preview(as: .systemSmall) {
    UltimateWidgetTodoWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
    TodoItemEntry(date: .now, emoji: "🤩")
}
