//
//  TaskListView.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI
import WidgetKit

struct TaskListView: View {
    
    @Environment(\.widgetTodoCore) var core
    let tasks: [Task]
    
    private var listDisplayControl: ListDisplayControl {
        return core.makeListDisplayControl(for: tasks)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: WidgetConfig.colorHeaderHeight - 16)
                
                HStack(spacing: 0) {
                    
                    HStack(alignment: .bottom, spacing: 4) {
                        Text(String(tasks.count))
                            .contentTransition(.numericText())
                            .font(.system(size: 30))
                            .bold()
                        Text("tasks")
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .offset(y: -4)
                    }
                    .foregroundStyle(Color.label)
                    
                    Spacer()

                    if listDisplayControl.canAppearScrollButtons {
                        
                        Group {
                            ListScrollButton(direction: .up,
                                             isDisabled: listDisplayControl.isDisableScrollUpButton)
                                .frame(width: 44,  height: 40)
                            ListScrollButton(direction: .down,
                                             isDisabled: listDisplayControl.isDisableScrollDownButton)
                                .frame(width: 44,  height: 40)
                        }
                        .offset(x: 8)
                    }
                    
                }
                .frame(height: WidgetConfig.topBarHeight)
                
                Line()
                    .stroke(style: .init(lineWidth: 2))
                    .foregroundStyle(.gray)
                    .frame(height: 2)
                    .padding(.bottom, 4)
                
                ForEach(listDisplayControl.displayTasks) {
                    TaskListRow(task: $0)
                }
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    PresentAddTaskViewButton(type: .floatingAction)
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
