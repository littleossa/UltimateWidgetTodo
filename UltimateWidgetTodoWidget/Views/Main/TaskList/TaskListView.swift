//
//  TaskListView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct TaskListView: View {
    
    let tasks: [Task]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: WidgetConfig.colorHeaderHeight - 16)
                HStack(alignment: .bottom) {
                    Text(String(tasks.count))
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
                
                ForEach(tasks) {
                    TaskListRow(task: $0)
                }
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    presentAddTaskViewButton(type: .floatingAction)
                    .frame(width: 44, height: 44)
                }
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
import WidgetKit

struct TaskListPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            TaskListView(tasks: [])
                .containerBackground(for: .widget) {
                    WidgetBackgroundView()
                }
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    TaskListPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
#endif
