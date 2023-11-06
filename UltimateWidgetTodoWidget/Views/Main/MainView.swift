//
//  MainView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftData
import SwiftUI
import WidgetKit

struct MainView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query (sort: \Task.createDate, order: .forward)
    private var tasks: [Task]

    var body: some View {
        
        Group {
            if tasks.isEmpty {
                TaskEmptyView()
            } else {
                TaskListView(tasks: tasks)
            }
        }
        .containerBackground(for: .widget) {
            WidgetBackgroundView()
        }
    }
}

// MARK: - Preview
#if DEBUG
struct MainPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            MainView()
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    MainPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
#endif
