//
//  KeyboardInputRepository.swift
//  UltimateWidgetTodo
//
//

import Foundation

class KeyboardInputRepository {
    
    init(store: UserDefaultsStore = .shared) {
        self.store = store
    }
    
    private let emojiKeyboardContents = EmojiKeyboardContent()
    private let frequentUsedEmojiLimitCount = 40
    private let store: UserDefaultsStore
    
    var emojiKeyboardColumns: [String] {
        let index = store.emojiKeyboardIndex
        if index > 0,
           index <= emojiKeyboardContents.keyboardLastIndex {
            return emojiKeyboardContents.getEmojis(for: index)
        }
        return .init(store.frequentlyUsedEmojis)
    }
    
    var emojiKeyboardIndex: Int {
        return store.emojiKeyboardIndex
    }
    
    var inputMode: KeyboardInputMode {
        return store.keyboardInputMode
    }
    
    var inputText: String {
        return store.inputText
    }
    
    var isCapsLocked: Bool {
        return store.isCapsLocked
    }
    
    var isLastPageOfEmoji: Bool {
        return store.emojiKeyboardIndex == emojiKeyboardContents.keyboardLastIndex
    }
    
    func appendFrequentUsedEmoji(_ emoji: String) {
        if store.frequentlyUsedEmojis.count == frequentUsedEmojiLimitCount {
            store.frequentlyUsedEmojis.removeLast()
        }
        store.frequentlyUsedEmojis.insert(emoji, at: 0)
    }
    
    func clearInputText() {
        return store.inputText = ""
    }
    
    func input(_ text: String) {
        store.inputText += text
    }
    
    func changeMode(into mode: KeyboardInputMode) {
        store.keyboardInputMode = mode
    }
    
    func deleteLastCharacter() {
        var inputText = store.inputText
        guard !inputText.isEmpty
        else { return }
        inputText.removeLast()
        store.inputText = inputText
    }
    
    func toggleCapsLock() {
        store.isCapsLocked.toggle()
    }
}
