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
    
    var currentEmojiCategory: EmojiKeyboardContent.Category {
        let index = store.emojiKeyboardIndex
        return emojiKeyboardContents.getCategory(for: index)
    }
    
    var currentEmojiContent: [String] {
        let index = store.emojiKeyboardIndex
        if index > 0,
           index <= emojiKeyboardContents.keyboardEndIndex {
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
    
    var isEmojiLastContent: Bool {
        return store.emojiKeyboardIndex == emojiKeyboardContents.keyboardEndIndex
    }
    
    func appendFrequentlyUsedEmoji(_ emoji: String) {
        
        store.frequentlyUsedEmojis.removeAll(where: { $0 == emoji })
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
    
    func goBackEmojiContent() {
        let currentIndex = store.emojiKeyboardIndex
        if currentIndex == emojiKeyboardContents.keyboardStartIndex {
            return
        }
        let index = currentIndex - 1
        store.emojiKeyboardIndex = index
    }
    
    func goForwardEmojiContent() {
        let currentIndex = store.emojiKeyboardIndex
        if currentIndex == emojiKeyboardContents.keyboardEndIndex {
            return
        }
        let index = currentIndex + 1
        store.emojiKeyboardIndex = index
    }
    
    func moveEmojiContent(for index: Int) {
        store.emojiKeyboardIndex = index
    }
    
    func toggleCapsLock() {
        store.isCapsLocked.toggle()
    }
}
