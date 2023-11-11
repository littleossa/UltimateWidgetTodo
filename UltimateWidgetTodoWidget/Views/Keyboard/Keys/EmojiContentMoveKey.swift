//
//  EmojiRightPageKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct EmojiContentMoveKey: View {
    
    enum Direction {
        case back
        case forward
    }
    
    let type: Direction
    
    private var moveKeyIntent: any AppIntent {
        switch type {
        case .back:
            return EmojiContentGoBackKeyIntent()
        case .forward:
            return EmojiContentGoForwardRightKeyIntent()
        }
    }
    
    var body: some View {
        
        Button(intent: moveKeyIntent) {
            Image(systemName: type == .back ? "chevron.left" : "chevron.right")
        }
    }
}

#Preview {
    HStack {
        EmojiContentMoveKey(type: .back)
        EmojiContentMoveKey(type: .forward)
    }
}

struct EmojiContentGoBackKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Emoji content go back key"
    
    @Parameter(title: "Emoji content go back key")
    var id: String
    
    init() {
        id = "emojiContentGoBackKey"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapGoBackEmojiContentKey()
        return .result()
    }
}


struct EmojiContentGoForwardRightKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Emoji content go forward key"
    
    @Parameter(title: "Emoji content go forward key")
    var id: String
    
    init() {
        id = "emojiContentGoForwardKey"
    }
    
    func perform() async throws -> some IntentResult {
        WidgetTodoCore.shared.onTapGoForwardEmojiContentKey()
        return .result()
    }
}
