//
//  UltimateWidgetTodoWidget.swift
//  UltimateWidgetTodoWidget
//
//

import SwiftData
import SwiftUI
import WidgetKit

struct UltimateWidgetTodoWidget: Widget {
    
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetTodoProvider()) { entry in
              WidgetTodoView()
        }
        .supportedFamilies([.systemLarge])
        .configurationDisplayName("Ultimate Widget Todo")
        .description("This is an Ultimate Todo List App with a Widget.")
        .contentMarginsDisabled()
    }
}

#Preview(as: .systemLarge) {
    UltimateWidgetTodoWidget()
} timeline: {
    WidgetTodoEntry(date: .now)
    WidgetTodoEntry(date: .now)
}
