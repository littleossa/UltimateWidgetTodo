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
                    .frame(width: 36, height: 34)
                    .offset(y: 1)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.keyDarkGray)
                    .frame(width: 36, height: 34)
            }
            .overlay {
                
                ZStack {
                    Image(systemName: isLightMode ? "face.smiling" : "face.smiling.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.label)
                }
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
    
    @Parameter(title: "Emoji Mode key")
    var id: String
    
    init() {
        id = "emojiModekey"
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Do something
        print(id)
        return .result()
    }
}
