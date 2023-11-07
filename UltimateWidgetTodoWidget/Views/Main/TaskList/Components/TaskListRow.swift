//
//  TaskListRow.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import SwiftUI

struct TaskListRow: View {
    
    let task: Task
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                TaskCompleteButton(task: task)
                
                Text(task.name)
                    .font(.system(size: 16))
                
                Spacer()
            }
            .padding(.vertical, 8)
            
            Line()
                .stroke(style: .init(dash: [3, 3]))
                .foregroundColor(.gray)
                .frame(height: 0.5)
                .padding(.leading, 32)
        }
    }
}
