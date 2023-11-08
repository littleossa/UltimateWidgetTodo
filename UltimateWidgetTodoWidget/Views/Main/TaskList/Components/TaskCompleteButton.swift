//
//  TaskCompleteButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct TaskCompleteButton: View {
    
    let task: Task
    
    var body: some View {
        Toggle(isOn: false, intent: TaskCompleteIntent(task: task)) {
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

struct TaskCompleteIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Todo Complete"
    
    @Parameter(title: "Todo Item")
    var id: String
    
    init() {}
    
    init(task: Task) {
        self.id = task.taskId.uuidString
    }
    
    func perform() async throws -> some IntentResult {
        if let uuid = UUID(uuidString: id) {
            try await WidgetTodoCore().onTapCompleteTask(id: uuid)
        }
        
        return .result()
    }
}
