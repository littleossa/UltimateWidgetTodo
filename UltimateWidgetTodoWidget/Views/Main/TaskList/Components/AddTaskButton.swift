//
//  AddTaskButton.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import WidgetKit
import SwiftUI

struct AddTaskButton: View {
    
    enum AddTaskButtonType {
        case floatingAction
        case fullScreen
    }
    
    let type: AddTaskButtonType
            
    var body: some View {
        
        Button(intent: AddTaskButtonIntent()) {
            
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

struct AddTaskButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Tap Add button"
    
    @Parameter(title: "tapAddButton")
    var id: String
    
    init() {
        self.id = "tapAddButton"
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
