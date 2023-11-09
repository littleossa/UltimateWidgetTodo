//
//  TaskEmptyView.swift
//  UltimateWidgetTodoWidgetExtension
//
//


import SwiftUI

struct TaskEmptyView: View {
        
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text("What's your task?")
                        .font(.system(size: 32))
                        .bold()
                        .foregroundStyle(Color.black)
                    
                    Text("Start by adding a new one.")
                        .font(.system(size: 20))
                        .fontWeight(.light)
                }
                
                PlusButtonImage()
                    .frame(width: 80, height: 80)
                
                Spacer()
            }
            presentAddTaskViewButton(type: .fullScreen)
        }
    }
}

// MARK: - Preview
#if DEBUG
import WidgetKit

struct TaskEmptyPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            TaskEmptyView()
                .containerBackground(for: .widget) {
                    WidgetBackgroundView()
                }
                .modelContainer(SwiftDataStore.testStore.container)
        }
    }
}

#Preview(as: .systemLarge) {
    TaskEmptyPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
#endif
