//
//  EmojiRightPageKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct EmojiContentMoveKey: View {
    
    enum Direction {
        case left
        case right
    }
    
    let type: Direction
    
    private var moveKeyIntent: any AppIntent {
        switch type {
        case .left:
            return EmojiContentMoveLeftKeyIntent()
        case .right:
            return EmojiContentMoveRightKeyIntent()
        }
    }
    
    var body: some View {
        
        Button(intent: moveKeyIntent) {
            Image(systemName: type == .left ? "chevron.left" : "chevron.right")
        }
    }
}

#Preview {
    HStack {
        EmojiContentMoveKey(type: .left)
        EmojiContentMoveKey(type: .right)
    }
}

struct EmojiContentMoveLeftKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Emoji content move left key"
    
    @Parameter(title: "Emoji content move left key")
    var id: String
    
    init() {
        id = "emojiContentMoveLeftKey"
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Move to left page
        return .result()
    }
}


struct EmojiContentMoveRightKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Emoji content move right key"
    
    @Parameter(title: "Emoji content move right key")
    var id: String
    
    init() {
        id = "emojiContentMoveRightKey"
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Move to right page
        return .result()
    }
}
