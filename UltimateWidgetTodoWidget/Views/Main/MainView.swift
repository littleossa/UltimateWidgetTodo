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
    @Query (sort: \TodoItem.createDate, order: .reverse)
    private var items: [TodoItem]

    var body: some View {
        
        Group {
            if items.isEmpty {
                TodoItemEmptyView()
            } else {
                TodoItemListView(items: items)
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
    WidgetTodoEntry(date: .now)
}
#endif
