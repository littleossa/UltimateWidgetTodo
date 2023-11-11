//
//  EmojiKeyboard.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

struct EmojiKeyboard: View {
    
    @Environment(\.widgetTodoCore) var core
    
    var body: some View {
        
        VStack {
            
            HStack {
                EmojiContentMoveKey(type: .left)
                
                Spacer()
                
                Text(core.currentEmojiCategory.rawValue)
                    .font(.system(size: 10))
                    .foregroundStyle(Color.placeholderGray)
                
                Spacer()
                
                EmojiContentMoveKey(type: .right)
            }
            
            LazyHGrid(rows: Array(repeating: GridItem(), count: 4), spacing: 4) {
                ForEach(core.currentEmojiContent, id: \.self) { emoji in
                    Text(emoji)
                        .font(.system(size: 24))
                        .padding(.bottom, 4)
                }
            }
            .frame(height: 116)
            .offset(y: 8)
            
            HStack {
                AlphabetModeKey(hasKeyShape: false)
                
                Group {
                    Text("🕐")
                    Text("😃")
                    Text("🐻‍❄️")
                    Text("🍔")
                    Text("⚽️")
                    Text("🚗")
                    Text("💡")
                    Text("🔣")
                    Text("🏁")
                }
                .opacity(0.4)
                
                BackspaceKey(hasKeyShape: false)
            }
            .font(.system(size: 14))
            .offset(y: 8)
        }
        .frame(height: WidgetConfig.keyboardHeight - 16)
    }
}
