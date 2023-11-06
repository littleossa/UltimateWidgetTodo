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
            
            Group {
                switch ScreenManager.shared.currentScreen {
                case .main:
                    MainView()
                case .addTask:
                    AddTaskView()
                case .editTask:
                    Text("TODO: - editItem")
                }
            }
            .modelContainer(SwiftDataStore.shared.container)
            
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
