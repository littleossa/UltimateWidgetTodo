//
//  EmojiCategoryKey.swift
//  UltimateWidgetTodo
//
//

import AppIntents
import SwiftUI

struct EmojiCategoryKey: View {
    
    let category: EmojiKeyboardContent.Category
    
    var body: some View {
        Button(intent: EmojiCategoryKeyIntent()) {
            Text(category.info.icon)
                .font(.system(size: 14))
                .opacity(0.4)
        }
    }
}

#Preview {
    HStack {
        EmojiCategoryKey(category: .smilyAndPeople)
        EmojiCategoryKey(category: .animalsAndNature)
    }
}

struct EmojiCategoryKeyIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Emoji Category Key"
    
    @Parameter(title: "Emoji Category Key")
    var id: String
    
    init() {}
    
    init(category: EmojiKeyboardContent.Category) {
        self.id = category.rawValue
    }
    
    func perform() async throws -> some IntentResult {
        // TODO: Change Emoji Category
        return .result()
    }
}
