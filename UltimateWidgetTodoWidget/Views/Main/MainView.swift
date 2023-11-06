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
    private var items: [Task]

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
                    TaskListRow(task: $0)
                }
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    AddTaskButton()
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
