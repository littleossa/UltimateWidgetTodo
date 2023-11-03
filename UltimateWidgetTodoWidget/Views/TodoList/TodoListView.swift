//
//  TodoListView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftData
import SwiftUI
import WidgetKit

struct TodoListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query (sort: \TodoItem.createDate, order: .forward)
    private var items: [TodoItem]

    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                    .frame(height: WidgetConfig.colorHeaderHeight)
                
                Spacer()
                ForEach(items) {
                    Text($0.name)
                }
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    AddTodoItemButton()
                    .frame(width: 44, height: 44)
                    .buttonStyle(.plain)
                }
            }
        }
        .containerBackground(for: .widget) {
            WidgetBackgroundView()
        }
    }
}

// MARK: - Preview
#if DEBUG
struct TodoListPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            TodoListView()
                .modelContainer(AppModelContainer.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    TodoListPreviewWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
}
#endif
