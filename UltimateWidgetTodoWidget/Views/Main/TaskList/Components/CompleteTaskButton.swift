//
//  CompleteTaskButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct CompleteTaskButton: View {
    
    let task: Task
    
    var body: some View {
        Toggle(isOn: false, intent: CompleteTaskIntent(task: task)) {
            EmptyView()
        }
        .toggleStyle(TaskToggleStyle())
    }
}

struct TaskToggleStyle: ToggleStyle {
        
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
            .font(.system(size: 24))
            .foregroundColor( configuration.isOn ? .mint : .placeholderGray)
    }
}

struct CompleteTaskIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Complete Task"
    
    @Parameter(title: "Task ID")
    var id: String
    
    init() {}
    
    init(task: Task) {
        self.id = task.taskId.uuidString
    }
    
    func perform() async throws -> some IntentResult {
        if let uuid = UUID(uuidString: id) {
            await WidgetTodoCore.shared.onTapCompleteTask(id: uuid)
        }
        return .result()
    }
}
