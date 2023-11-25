//
//  SpaceKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct SpaceKey: View {
            
    var body: some View {
        
        Button(intent: SpaceKeyIntent()) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyWhite)
            }
            .overlay {
                Text("space")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.label)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            SpaceKey()
        }
}

struct SpaceKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Space key"
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapCharacterKey(" ")
        return .result()
    }
}
