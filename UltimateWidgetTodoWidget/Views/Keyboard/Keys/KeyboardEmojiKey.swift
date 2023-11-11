//
//  KeyboardEmojiKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct KeyboardEmojiKey: View {
    
    init(_ emoji: String) {
        self.emoji = emoji
    }
    
    let emoji: String
    
    var body: some View {
        
        Button(intent: KeyboardEmojiKeyIntent(emoji: emoji)) {
            Text(emoji)
                .font(.system(size: 20))
        }
        .buttonStyle(.plain)
    }
}

struct KeyboardEmojiKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Keyboard emoji key"
    
    @Parameter(title: "Keyboard emoji key")
    var emoji: String
    
    init() {}
    
    init(emoji: String) {
        self.emoji = emoji
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapEmojiKey(emoji)
        return .result()
    }
}


#Preview {
    Color.emojiKeyboardBackground
        .overlay {
            HStack {
                KeyboardEmojiKey("😃")
                KeyboardEmojiKey("🏳️‍🌈")
            }
        }
}
