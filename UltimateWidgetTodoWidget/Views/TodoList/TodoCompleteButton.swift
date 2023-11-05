//
//  TodoCompleteButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct TodoCompleteButton: View {
    
    let item: TodoItem
    
    var body: some View {
        Toggle(isOn: false, intent: TodoCompleteIntent(item: item)) {
            EmptyView()
        }
        .toggleStyle(TodoToggleStyle())
    }
}

struct TodoToggleStyle: ToggleStyle {
        
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
            .font(.system(size: 24))
            .foregroundColor( configuration.isOn ? .mint : .placeholderGray)
    }
}

struct TodoCompleteIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Todo Complete"
    
    @Parameter(title: "Todo Item")
    var id: String
    
    init() {}
    
    init(item: TodoItem) {
        self.id = item.itemId.uuidString
    }
    
    func perform() async throws -> some IntentResult {
        if let uuid = UUID(uuidString: id) {
            try await SwiftDataStore.shared.deleteItem(id: uuid)
        }
        
        return .result()
    }
}
