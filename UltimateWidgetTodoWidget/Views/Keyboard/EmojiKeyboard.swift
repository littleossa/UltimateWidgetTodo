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
                        
            HStack {
                
                ZStack(alignment: .leading) {
                    if !core.isEmojiFirstContent {
                        EmojiContentMoveKey(type: .back)
                    }
                }
                .frame(width: 20)
                
                Spacer()
                
                Text(core.currentEmojiCategory.info.title)
                    .font(.system(size: 11))
                    .bold()
                    .foregroundStyle(Color.placeholderGray)
                
                Spacer()
                
                ZStack(alignment: .trailing) {
                    if !core.isEmojiLastContent {
                        EmojiContentMoveKey(type: .forward)
                    }
                }
                .frame(width: 20)
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
                        
            HStack(spacing: 0) {
                
                if core.currentEmojiContent.count <= 36 {
                    Spacer().frame(width: 6)
                }
                
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
            
            HStack(spacing: 4) {
                AlphabetModeKey(hasKeyShape: false)
                
                ForEach(EmojiKeyboardContent.Category.allCases) {
                    EmojiCategoryKey(category: $0,
                                     currentCategory: core.currentEmojiCategory)
                }
                
                BackspaceKey(hasKeyShape: false)
            }
        }
        .frame(width: 300)
    }
}
