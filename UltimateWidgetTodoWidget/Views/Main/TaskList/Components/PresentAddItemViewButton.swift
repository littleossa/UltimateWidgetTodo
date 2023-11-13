//
//  PresentAddItemViewButton.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import WidgetKit
import SwiftUI

struct PresentAddItemViewButton: View {
    
    enum ButtonType {
        case floatingAction
        case fullScreen
    }
    
    let type: ButtonType
            
    var body: some View {
        
        Button(intent: PresentAddItemViewIntent()) {
            
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

struct PresentAddItemViewIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Present Add Item view button"
    
    @Parameter(title: "Present Add item view button")
    var id: String
    
    init() {
        self.id = "presentAddItemViewButton"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapPresentAddItemView()
        return .result()
    }
}

#if DEBUG
#Preview(as: .systemLarge) {
    TodoItemListPreviewWidget()
} timeline: {
    WidgetTodoEntry(date: .now)
}
#endif
