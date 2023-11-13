//
//  BackButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct CloseButton: View {
    
    let type: EditTodoItemType
    
    var body: some View {
        
        Button(intent: CloseEditItemViewButtonIntent()) {
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

