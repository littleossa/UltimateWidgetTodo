//
//  AddButton.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import WidgetKit
import SwiftUI

struct AddTodoItemButton: View {
            
    var body: some View {
        
        Button(intent: AddTodoItemButtonIntent()) {
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

struct AddTodoItemButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Tap Add button"
    
    @Parameter(title: "tapAddButton")
    var id: String
    
    init() {
        self.id = "tapAddButton"
    }
    
    func perform() async throws -> some IntentResult {
        ScreenManager.shared.switchToScreen(.addItem)
        return .result()
    }
}

#Preview(as: .systemLarge) {
    TodoListPreviewWidget()
} timeline: {
    TodoItemEntry(date: .now, emoji: "😀")
}
