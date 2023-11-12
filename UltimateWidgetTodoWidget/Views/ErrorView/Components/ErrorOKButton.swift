//
//  ErrorOKButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct ErrorOKButton: View {
    
    var body: some View {
        
        Button(intent: ErrorOKButtonIntent()) {
            Rectangle()
                .fill(.keyboardBackground.opacity(0.001))
                .overlay {
                    Text("OK")
                        .font(.system(size: 26))
                        .bold()
                        .foregroundStyle(.blue)
                }
            
        }
        .foregroundStyle(.blue)
        .buttonStyle(.plain)
    }
}

#Preview {
    ErrorOKButton()
}

struct ErrorOKButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Error OK Button"
    
    @Parameter(title: "Error OK Button")
    var id: String
    
    init() {
        id = "errorOKButton"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapErrorOKButton()
        return .result()
    }
}
