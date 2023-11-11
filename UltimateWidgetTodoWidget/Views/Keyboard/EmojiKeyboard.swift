//
//  EmojiKeyboard.swift
//  UltimateWidgetTodo
//
//

import SwiftUI

struct EmojiKeyboard: View {
    
    @Environment(\.widgetTodoCore) var core
    
    var body: some View {
        
        VStack(spacing: 4) {
            
            Spacer().frame(height: 4)
            
            HStack {
                
                ZStack {
                    if !core.isEmojiFirstContent {
                        EmojiContentMoveKey(type: .back)
                    }
                }
                .frame(width: 20)
                
                Spacer()
                
                Text(core.currentEmojiCategory.rawValue)
                    .font(.system(size: 11))
                    .bold()
                    .foregroundStyle(Color.placeholderGray)
                
                Spacer()
                
                ZStack {
                    if !core.isEmojiLastContent {
                        EmojiContentMoveKey(type: .forward)
                    }
                }
                .frame(width: 20)
            }
            
            HStack {
                LazyHGrid(rows: Array(repeating: GridItem(), count: 4), spacing: 4) {
                    ForEach(core.currentEmojiContent, id: \.self) {
                        KeyboardEmojiKey($0)
                            .padding(.bottom, 4)
                    }
                }
                
                if core.currentEmojiContent.count <= 36 {
                    Spacer()
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
