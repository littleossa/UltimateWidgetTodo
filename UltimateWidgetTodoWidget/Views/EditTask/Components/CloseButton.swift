//
//  BackButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct CloseButton: View {
    
    let type: EditTaskType
    
    var body: some View {
        
        Button(intent: CloseButtonIntent()) {
            Image(systemName: type.closeButtonImageName)
                .font(.system(size: 24))
        }
        .foregroundStyle(.blue)
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack {
        CloseButton(type: .addNewTask)
        CloseButton(type: .editTask(id: UUID()))
    }
}

struct CloseButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Close Button"
    
    @Parameter(title: "Close Button")
    var id: String
    
    init() {
        id = "closeButton"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapCloseButton()
        return .result()
    }
}

