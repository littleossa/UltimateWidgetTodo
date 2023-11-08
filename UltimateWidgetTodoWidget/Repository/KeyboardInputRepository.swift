//
//  KeyboardInputRepository.swift
//  UltimateWidgetTodo
//
//

import Foundation

extension KeyboardInputRepository {
    // MARK: - Alphabet mode keys
    static let topRowAlphabets = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    static let centerRowAlphabets = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    static let bottomRowAlphabets = ["Z", "X", "C", "V", "B", "N", "M"]
    
    // MARK: - Number mode keys
    static let topRowNumbers = ["1", "2", "3", "4", "5" , "6", "7", "8", "9", "0"]
    static let centerRowPunctuationMarks = ["-", "/", ":", ";", "(" , ")", "$", "&", "@", "“"]
    static let bottomRowPunctuationMarks = [".", ",", "?", "!", "‘"]
    // MARK: - Extra punctuation marks mode keys
    static let topRowExtraPunctuationMarks = ["[", "]", "{", "}", "#" , "%", "^", "*", "+", "="]
    static let centerRowExtraPunctuationMarks = ["_", "\\", "|", "~", "<" , ">", "€", "£", "¥", "•"]
    
}

class KeyboardInputRepository {
    
    init(store: UserDefaultsStore = .shared) {
        self.store = store
    }
    
    private let store: UserDefaultsStore
    
    var inputMode: KeyboardInputMode {
        return store.keyboardInputMode
    }
    
    var inputText: String {
        return store.inputText
    }
    
    var isCapsLocked: Bool {
        return store.isCapsLocked
    }
    
    var isNumberMode: Bool {
        return store.keyboardInputMode == .number
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
