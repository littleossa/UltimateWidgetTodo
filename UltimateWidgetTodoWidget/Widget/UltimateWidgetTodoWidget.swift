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
            TodoListView()
                .containerBackground(for: .widget) {
                    WidgetBackgroundView()
                }
                .modelContainer(AppModelContainer.shared.container)
        }
        .configurationDisplayName("Ultimate Widget Todo")
        .description("This is an Ultimate Todo List App with a Widget.")
    }
}

struct WidgetBackgroundView: View {
    
    let topBarColor = LinearGradient(colors: [.indigo, .blue, .cyan, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(topBarColor)
                .frame(height: WidgetConfig.topBarHeight)
            
            Spacer()
        }
        .background(.widgetBackground)
    }
}

#Preview(as: .systemLarge) {
    UltimateWidgetTodoWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
    TodoItemEntry(date: .now, emoji: "🤩")
}
