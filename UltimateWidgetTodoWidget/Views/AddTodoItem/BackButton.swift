//
//  BackButton.swift
//  UltimateWidgetTodoWidgetExtension
//
//

import AppIntents
import SwiftUI

struct BackButton: View {
    
    var body: some View {
        
        Button(intent: BackButtonIntent()) {
            Image(systemName: "chevron.left")
                .font(.system(size: 24))
        }
        .foregroundStyle(.blue)
        .frame(width: WidgetConfig.topBarHeight,
               height: WidgetConfig.topBarHeight)
        .buttonStyle(.plain)
    }
}

#Preview {
    BackButton()
}

struct BackButtonIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Back Button"
    
    @Parameter(title: "Back Button")
    var id: String
    
    init() {
        id = "backButton"
    }
    
    func perform() async throws -> some IntentResult {
        UserDefaultsStore.shared.isShownKeyboard = false
        return .result()
    }
}

