//
//  BackButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct CloseButton: View {
    
    let type: EditTodoItemType
    
    private var closeButtonIntent: any AppIntent {
        switch type {
        case .addNewTodoItem:
            return CloseAddItemViewButtonIntent()
        case .editTodoItem:
            return CloseEditItemViewButtonIntent()
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
        CloseButton(type: .addNewTodoItem)
        CloseButton(type: .editTodoItem(id: UUID()))
    }
}

struct CloseAddItemViewButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Close Add Item View Button"
    
    @Parameter(title: "Close Add Item View Button")
    var id: String
    
    init() {
        id = "closeAddItemViewButton"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapCloseAddItemViewButton()
        return .result()
    }
}

struct CloseEditItemViewButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Close Edit Item View Button"
    
    @Parameter(title: "Close Edit Item View Button")
    var id: String
    
    init() {
        id = "closeEditItemViewButton"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapCloseEditItemViewButton()
        return .result()
    }
}

