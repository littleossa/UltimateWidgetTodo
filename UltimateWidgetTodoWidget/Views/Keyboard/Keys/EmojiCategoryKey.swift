//
//  EmojiCategoryKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct EmojiCategoryKey: View {
    
    let category: EmojiKeyboardContent.Category
    let currentCategory: EmojiKeyboardContent.Category
    
    private var isCategorySelected: Bool {
      return category == currentCategory
    }
    
    var body: some View {
        Button(intent: EmojiCategoryKeyIntent(category: category)) {
            Text(category.info.icon)
                .font(.system(size: 12))
                .opacity(isCategorySelected ? 0.8 : 0.4)
                .background  {
                    if isCategorySelected {
                        Circle()
                            .fill(.keyDarkGray)
                            .frame(width: 22, height: 22)
                    }
                }
                .frame(width: 22, height: 22)
        }
    }
}

#Preview {
    
    Color.emojiKeyboardBackground
        .overlay {
            HStack {
                EmojiCategoryKey(category: .smilyAndPeople,
                                 currentCategory: .smilyAndPeople)
                EmojiCategoryKey(category: .animalsAndNature,
                                 currentCategory: .activity)
            }
        }
}

struct EmojiCategoryKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Emoji Category Key"
    
    @Parameter(title: "Emoji Category ID")
    var id: String
    
    init() {}
    
    init(category: EmojiKeyboardContent.Category) {
        self.id = category.rawValue
    }
    
    func perform() async throws -> some IntentResult {        
        if let category = EmojiKeyboardContent.Category(rawValue: id) {
            WidgetTodoCore.shared.onTapEmojiCategoryKey(category)
        }
        return .result()
    }
}
