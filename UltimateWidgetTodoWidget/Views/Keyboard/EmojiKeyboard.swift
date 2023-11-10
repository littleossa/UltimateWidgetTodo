//
//  EmojiKeyboard.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

struct EmojiKeyboard: View {
    
    var frontEmoji: [String] {
        var array =         Emoji.emoticons

        if array.count >= 50 {
            let startIndex = 50 // 削除を開始する位置
            let endIndex = array.count // 配列の最後の要素の次の位置

            array.removeSubrange(startIndex..<endIndex)
            return Array(array)
        } else {
            return []
        }
    }

    var body: some View {
        
        ScrollView {
            LazyHGrid(rows: Array(repeating: GridItem(), count: 5), spacing: 4) { // カラム数の指定
                ForEach(frontEmoji, id: \.self) { emoji in
                    Text(emoji)
                }
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
import WidgetKit

struct EmojiKeyboardPreviewWidget: Widget {
    let kind: String = "UltimateWidgetTodo"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WidgetTodoProvider()
        ) { entry in
            EmojiKeyboard()
                .containerBackground(for: .widget) {
                    KeyboardOverlayBackgroundView()
                }
        }
    }
}

#Preview(as: .systemLarge) {
    EmojiKeyboardPreviewWidget()
} timeline: {
    TaskEntry(date: .now)
}
#endif
