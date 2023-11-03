//
//  TodoListRow.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct TodoListRow: View {
    
    let item: TodoItem
    
    var body: some View {
        
        VStack {
            HStack {
                Toggle(isOn: false, intent: TodoCompleteIntent(item: item)) {
                    EmptyView()
                }
                .frame(width: 40, height: 40)
                .toggleStyle(TodoToggleStyle())
                
                Text(item.name)
                    .font(.system(size: 16))
                
                Spacer()
            }
            
            Divider()
        }
    }
}

struct TodoToggleStyle: ToggleStyle {
        
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
            .font(.system(size: 32))
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
