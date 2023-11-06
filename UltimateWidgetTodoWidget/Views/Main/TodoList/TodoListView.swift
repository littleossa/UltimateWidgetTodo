//
//  TodoListView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct TodoListView: View {
    
    let items: [TodoItem]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: WidgetConfig.colorHeaderHeight - 16)
                HStack(alignment: .bottom) {
                    Text(String(items.count))
                        .font(.system(size: 30))
                        .bold()
                    Text("tasks")
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                        .offset(y: -4)
                    
                    Spacer()
                }
                .foregroundStyle(Color.label)
                .frame(height: WidgetConfig.topBarHeight)
                
                Line()
                    .stroke(style: .init(lineWidth: 2))
                    .foregroundStyle(.gray)
                    .frame(height: 2)
                    .padding(.bottom, 4)
                
                ForEach(items) {
                    TodoListRow(item: $0)
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
    }
}

// MARK: - Preview
#if DEBUG
import WidgetKit

struct TodoListPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            TodoListView(items: [])
                .containerBackground(for: .widget) {
                    WidgetBackgroundView()
                }
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    TodoListPreviewWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
}
#endif
