//
//  CompleteTodoItemButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct CompleteTodoItemButton: View {
    
    let item: TodoItem
    
    var body: some View {
        Toggle(isOn: false, intent: CompleteTodoItemIntent(item: item)) {
            EmptyView()
        }
        .toggleStyle(TodoItemToggleStyle())
    }
}

struct TodoItemToggleStyle: ToggleStyle {
        
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
            .font(.system(size: 24))
            .foregroundColor( configuration.isOn ? .mint : .placeholderGray)
    }
}

struct CompleteTodoItemIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Complete TODO Item"
    
    @Parameter(title: "Item ID")
    var id: String
    
    init() {}
    
    init(item: TodoItem) {
        self.id = item.itemId.uuidString
    }
    
    func perform() async throws -> some IntentResult {
        if let uuid = UUID(uuidString: id) {
            
            do {
                try await WidgetTodoCore.shared.onTapCompleteTodoItem(id: uuid)
            } catch {
                WidgetTodoCore.shared.showError(.todoItemDeletionFailure)
            }
        }
        return .result()
    }
}
