//
//  DoneKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI
import WidgetKit

struct DoneKey: View {
    
    init(inputText: String, type: EditTodoItemType) {
        self.inputText = inputText
        self.type = type
    }
    
    let inputText: String
    let type: EditTodoItemType
    
    private var DoneKeyIntent: any AppIntent {
        switch type {
        case .addNewTodoItem:
            return AddItemDoneKeyIntent()
        case .editTodoItem(let id):
            return EditItemDoneKeyIntent(itemId: id)
        }
    }
            
    var body: some View {
        
        Button(intent: DoneKeyIntent) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(inputText.isEmpty ? .keyDarkGray : .blue)
            }
            .overlay {
                Text("done")
                    .font(.system(size: 14))
                    .bold()
                    .foregroundStyle(inputText.isEmpty ? .gray : .white)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            HStack {
                DoneKey(inputText: "", type: .addNewTodoItem)
                DoneKey(inputText: "something", type: .addNewTodoItem)
            }
        }
}


struct AddItemDoneKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Add Item Done key"
    
    func perform() async throws -> some IntentResult {
        do {
            try await WidgetTodoCore.shared.onTapAddItemDoneKey()
        } catch {
            let widgetError = error as? WidgetError
            WidgetTodoCore.shared.showError(widgetError ?? .unknown)
        }
        return .result()
    }
}

struct EditItemDoneKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Edit Item Done key"
    
    @Parameter(title: "Edit Item ID")
    var id: String
        
    init() {}
    
    init(itemId: UUID) {
        id = itemId.uuidString
    }
    
    func perform() async throws -> some IntentResult {
        
        if let uuid = UUID(uuidString: id) {
            do {
                try await WidgetTodoCore.shared.onTapEditItemDoneKey(id: uuid)
            } catch {
                let widgetError = error as? WidgetError
                WidgetTodoCore.shared.showError(widgetError ?? .todoItemEditingFailure)
            }
        }
        return .result()
    }
}
