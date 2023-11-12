//
//  TodoItemListRow.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI
import WidgetKit

struct TodoItemListRow: View {
    
    let item: TodoItem
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                CompleteTodoItemButton(item: item)
                
                Button(intent: TodoItemListRowSelectIntent(item: item)) {
                    Rectangle()
                        .fill(.widgetBackground.opacity(0.001))
                        .overlay {
                            
                            HStack {
                                Text(item.name)
                                    .font(.system(size: 16))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 12))
                                    .foregroundStyle(Color.placeholderGray)
                            }
                        }
                }
                .buttonStyle(.plain)
            }
            .frame(height: 24)
            .padding(.vertical, 8)
            
            Line()
                .stroke(style: .init(dash: [3, 3]))
                .foregroundColor(.gray)
                .frame(height: 0.5)
                .padding(.leading, 32)
        }
    }
}

struct TodoItemListRowSelectIntent: AppIntent {
    
    static var title: LocalizedStringResource = "TODO Item List Row"
    
    @Parameter(title: "Item ID")
    var id: String
    
    @Parameter(title: "Item name")
    var name: String
    
    init() {}
    
    init(item: TodoItem) {
        self.id = item.itemId.uuidString
        self.name = item.name
    }
    
    func perform() async throws -> some IntentResult {
        if let uuid = UUID(uuidString: id) {
            WidgetTodoCore.shared.onTapTodoItemListRow(id: uuid, name: name)
        }
        return .result()
    }
}
