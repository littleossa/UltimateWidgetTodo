//
//  presentAddTaskViewButton.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import WidgetKit
import SwiftUI

struct presentAddTaskViewButton: View {
    
    enum AddTaskButtonType {
        case floatingAction
        case fullScreen
    }
    
    let type: AddTaskButtonType
            
    var body: some View {
        
        Button(intent: presentAddTaskViewIntent()) {
            
            switch type {
            case .floatingAction:
                AddTaskButtonImage()
            case .fullScreen:
                Rectangle()
                    .fill(.white.opacity(0.0001))
            }
        }
        .buttonStyle(.plain)
    }
}

struct presentAddTaskViewIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Present Add task view button"
    
    @Parameter(title: "Present Add task view button")
    var id: String
    
    init() {
        self.id = "presentAddTaskViewButton"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore().onTapPresentAddTaskView()
        return .result()
    }
}

#Preview(as: .systemLarge) {
    TaskListPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
