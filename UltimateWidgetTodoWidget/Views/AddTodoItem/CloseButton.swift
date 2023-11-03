//
//  BackButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct CloseButton: View {
    
    var body: some View {
        
        Button(intent: CloseButtonIntent()) {
            Image(systemName: "xmark")
                .font(.system(size: 24))
        }
        .foregroundStyle(.blue)
        .frame(width: WidgetConfig.topBarHeight,
               height: WidgetConfig.topBarHeight)
        .buttonStyle(.plain)
    }
}

#Preview {
    CloseButton()
}

struct CloseButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Close Button"
    
    @Parameter(title: "Close Button")
    var id: String
    
    init() {
        id = "closeButton"
    }
    
    func perform() async throws -> some IntentResult {
        ScreenManager.shared.switchToScreen(.todoList)
        return .result()
    }
}

