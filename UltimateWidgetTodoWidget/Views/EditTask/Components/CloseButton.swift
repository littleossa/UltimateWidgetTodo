//
//  BackButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct CloseButton: View {
    
    let type: EditTaskType
    
    private var closeButtonIntent: any AppIntent {
        switch type {
        case .addNewTask:
            return CloseAddTaskViewButtonIntent()
        case .editTask:
            return CloseEditTaskViewButtonIntent()
        }
    }
    
    var body: some View {
        
        Button(intent: closeButtonIntent) {
            Image(systemName: type.closeButtonImageName)
                .font(.system(size: 24))
        }
        .foregroundStyle(.blue)
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack {
        CloseButton(type: .addNewTask)
        CloseButton(type: .editTask(id: UUID()))
    }
}

struct CloseAddTaskViewButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Close Add Task View Button"
    
    @Parameter(title: "Close Add Task View Button")
    var id: String
    
    init() {
        id = "closeAddTaskViewButton"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapCloseAddTaskViewButton()
        return .result()
    }
}

struct CloseEditTaskViewButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Close Edit Task View Button"
    
    @Parameter(title: "Close Edit Task View Button")
    var id: String
    
    init() {
        id = "closeEditTaskViewButton"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapCloseEditTaskViewButton()
        return .result()
    }
}

