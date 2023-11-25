//
//  NumberModeKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct NumberModeKey: View {
            
    var body: some View {
        
        Button(intent: NumberModeIntent()) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyDarkGray)
            }
            .overlay {
                Image(systemName: "textformat.123")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.label)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            NumberModeKey()
        }
}


struct NumberModeIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Number Mode key"
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapNumberModeKey()
        return .result()
    }
}
