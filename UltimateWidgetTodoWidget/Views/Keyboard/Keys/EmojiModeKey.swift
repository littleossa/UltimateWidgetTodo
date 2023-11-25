//
//  EmojiModeKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct EmojiModeKey: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var isLightMode: Bool {
        return colorScheme == .light
    }
            
    var body: some View {
        
        Button(intent: EmojiModeIntent()) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyShadow)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyDarkGray)
            }
            .overlay {
                Image(systemName: isLightMode ? "face.smiling" : "face.smiling.fill")
                    .font(.system(size: 18))
                    .foregroundStyle(Color.label)
            }
        }
    }
}

#Preview {
    Color.keyboardBackground
        .overlay {
            HStack {
                EmojiModeKey()
                EmojiModeKey()
                    .environment(\.colorScheme, .dark)
            }
        }
}


struct EmojiModeIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Emoji Mode key"
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapEmojiModeKey()
        return .result()
    }
}
