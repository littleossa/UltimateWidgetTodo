//
//  UltimateWidgetTodoWidget.swift
//  UltimateWidgetTodoWidget
//
//

import SwiftData
import SwiftUI
import WidgetKit

struct UltimateWidgetTodoWidget: Widget {
    
    let widgetTodoCore = WidgetTodoCore.shared
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetTodoProvider()) { entry in
            
            Group {
                switch widgetTodoCore.currentScreen {
                case .main:
                    MainView()
                case .addTask:
                    EditTaskView(type: .addNewTask)
                case let .editTask(id):
                    EditTaskView(type: .editTask(id: id))
                }
            }
            .modelContainer(widgetTodoCore.swiftDataContainer)
            
        }
        .supportedFamilies([.systemLarge])
        .configurationDisplayName("Ultimate Widget Todo")
        .description("This is an Ultimate Todo List App with a Widget.")
    }
}

#Preview(as: .systemLarge) {
    UltimateWidgetTodoWidget()
} timeline: {
    TaskEntry(date: .now)
    TaskEntry(date: .now)
}
