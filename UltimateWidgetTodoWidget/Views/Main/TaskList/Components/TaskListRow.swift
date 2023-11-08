//
//  TaskListRow.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI
import WidgetKit

struct TaskListRow: View {
    
    let task: Task
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                TaskCompleteButton(task: task)
                
                Button(intent: TaskListRowSelectIntent(task: task)) {
                    Rectangle()
                        .fill(.widgetBackground.opacity(0.001))
                        .overlay {
                            
                            HStack {
                                Text(task.name)
                                    .font(.system(size: 16))
                                
                                Spacer()
                            }
                        }
                }
                .buttonStyle(.plain)
            }
            .frame(height: 24)
            .padding(.vertical, 8)
            
            Line()
                .stroke(style: .init(dash: [3, 3]))
                .foregroundColor(.gray)
                .frame(height: 0.5)
                .padding(.leading, 32)
        }
    }
}

struct TaskListRowSelectIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Task List Row"
    
    @Parameter(title: "Task ID")
    var id: String
    
    @Parameter(title: "Task name")
    var name: String
    
    init() {}
    
    init(task: Task) {
        self.id = task.taskId.uuidString
        self.name = task.name
    }
    
    func perform() async throws -> some IntentResult {
        if let uuid = UUID(uuidString: id) {
            WidgetTodoCore().onTapTaskListRow(id: uuid, name: name)
        }
        return .result()
    }
}
