//
//  PresentAddTaskViewButton.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import WidgetKit
import SwiftUI

struct PresentAddTaskViewButton: View {
    
    enum ButtonType {
        case floatingAction
        case fullScreen
    }
    
    let type: ButtonType
            
    var body: some View {
        
        Button(intent: PresentAddTaskViewIntent()) {
            
            switch type {
            case .floatingAction:
                PlusButtonImage()
            case .fullScreen:
                Rectangle()
                    .fill(.white.opacity(0.0001))
            }
        }
        .buttonStyle(.plain)
    }
}

struct PresentAddTaskViewIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Present Add task view button"
    
    @Parameter(title: "Present Add task view button")
    var id: String
    
    init() {
        self.id = "presentAddTaskViewButton"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapPresentAddTaskView()
        return .result()
    }
}

#Preview(as: .systemLarge) {
    TaskListPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
