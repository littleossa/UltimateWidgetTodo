//
//  AddTaskButton.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import WidgetKit
import SwiftUI

struct AddTaskButton: View {
            
    var body: some View {
        
        Button(intent: AddTaskButtonIntent()) {
            ZStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundStyle(.widgetBackground)
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundStyle(.blue)
            }
        }
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
        ScreenManager.shared.switchToScreen(.addTask)
        return .result()
    }
}

#Preview(as: .systemLarge) {
    TaskListPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
